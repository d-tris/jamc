module jamc.api.events;

import std.traits;

interface IEventDispatcher
{
public:
   
    /**
     * Preda udalost \a event posluchacum na udalost typu \a EType
     * a nizsi pochazejici ze zdroje \a source
     */
    void raise( EType : IEvent )( EType event, Object source = null )
    {
        onRaise( event, source, typeid( EType ) );
        
        foreach( base; TransitiveBaseTypeTuple!EType )
        {
            if( is( base : IEvent) )
            {
                onRaise( event, source, typeid( base ) );
            }
        }
    }
    
    /**
     * Prida posluchace na udalost typu EType. Posluchacem muze byt 
     * delegate s jedinym parametrem prave typu EType a libovolnym 
     * navratovm typem. Posluchac existuje tak dlouho, dokud 
     * existuje objekt \a guard. Pokud je \a guard null, tak 
     * posluchac existuje do zniceni tohoto IEventDispatcheru.
     */
    IEventListener addListener( EType : IEvent, RType )( RType delegate( EType ) theListener, Object source = null, Object guard = null)
    {
        return onNewListener( new EventListener!( EType, RType delegate( EType ) )( theListener, typeid( EType ), source ), guard );
    }
    
    void removeListener( IEventListener listener );

protected:

    class EventListener( EType, DType ) : IEventListener
    {
    public:
        this( DType listener, TypeInfo type, Object source )
        {
            m_listener = listener;
            m_type = type;
            m_source = source;
        }
        override void call( IEvent event )
        {
            m_listener( cast( EType ) event );
        }
        
        override @property TypeInfo type()
        {
            return m_type;
        }
        
        override @property Object source()
        {
            return m_source;
        }
    private:
        DType m_listener;
        TypeInfo m_type;
        Object m_source;
    }
            
    void onRaise( IEvent event, Object source, TypeInfo type );
    IEventListener onNewListener( IEventListener listener, Object guard );
        
}

/**
 * Reprezentuje jednoho posluchace na nejakou udalost
 */
interface IEventListener
{
    void call( IEvent event );
    @property TypeInfo type();
    @property Object source();
}

/** 
 * Tenhle interface je zatim asi vicemene k nicemu, ale zatim ho 
 * nechame
 */
interface IEvent
{
}
