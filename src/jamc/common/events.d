module jamc.common.events;

import jamc.api.events;

import std.container;
import std.typecons;

// skryte funkce runtimu...
private alias void delegate(Object) DEvent;
private extern (C) void rt_attachDisposeEvent(Object h, DEvent e);
private extern (C) void rt_detachDisposeEvent(Object h, DEvent e);



/**
 * Utilitisticka trida pouzitelna jako rodic jinych trid, ktere 
 * casto vyhazuji udalosti.
 * Priklad pouziti:
 * \code
 * class mujSuprButton : EventSource {
 *     ...
 *     this( IEventDispatcher ed ){ super( ed ); }
 *     ...
 *     // udalost bude vyslana z teto tridy za pouziti
 *     // drive ulozeneho dispatcheru
 *     onClick(){ raise( new ButtonClickEvent() ); } 
 *     ...
 * }
 */
class EventSource
{
public:
    this( IEventDispatcher dispatcher )
    {
        m_dispatcher = dispatcher;
    }

    void raise( T : IEvent )( T event )
    {
        m_dispatcher.raise( event, this );
    }
        
private:
    IEventDispatcher m_dispatcher;
}


class EventDispatcher : IEventDispatcher
{
public:
    void removeListener( IEventListener listener )
    {
        m_listeners[ tuple( listener.type, listener.source ) ].removeKey( listener );
    }
    
protected:

    static struct ListenerGuard
    {
    public:
        this( EventDispatcher ed, IEventListener listener, Object guard )
        {
            m_ed = ed;
            m_listener = listener;
            rt_attachDisposeEvent( guard, &unhook );
        }
        
        void unhook( Object guard )
        {
            rt_detachDisposeEvent( guard, &unhook );
            m_ed.removeListener( m_listener );
        }
    private:
        EventDispatcher m_ed;
        IEventListener m_listener;
    }
        

    override void onRaise( IEvent event, Object source, TypeInfo type )
    {    
        if( source !is null )
        {
            auto tree = m_listeners.get( tuple( type, source ), null );
            if( tree !is null )
            {
                foreach( listener; tree )
                {
                    listener.call( event );
                }
            }
        }
        
        auto tree = m_listeners.get( tuple( type, cast(Object) null ), null );
        if( tree !is null )
        {
            foreach( listener; tree )
            {
                listener.call( event );
            }
        }

    }
    override IEventListener onNewListener( IEventListener listener, Object guard )
    {
        auto tree = m_listeners.get( tuple( listener.type, listener.source ), new ListenerList() );
        tree.stableInsert( listener );
        m_listeners[ tuple( listener.type, listener.source ) ] = tree;
        if( guard !is null )
        {
            new ListenerGuard( this, listener, guard );
        }
        return listener;
    }
    
private:
    alias RedBlackTree!( IEventListener, "cast(void*)a < cast(void*)b") ListenerList;
    ListenerList[ Tuple!( TypeInfo, Object) ] m_listeners;
}

unittest
{
    class Ev1 : IEvent{};
    class Ev2 : IEvent{};
    class Ev3 : IEvent{};
    
    {
        int caught = 0;
        scope IEventDispatcher ed = new EventDispatcher();
        ed.raise( new Ev1() );
        ed.raise( new Ev2() );
        ed.raise( new Ev3() );
        assert( caught == 0 );
        
        ed.addListener( (Ev1 e){ caught++; } );
        
        ed.raise( new Ev1() );
        ed.raise( new Ev2() );
        ed.raise( new Ev3() );
        assert( caught == 1 );
        
        caught = 0;
        
        ed.addListener( (Ev1 e){ caught++; } );
        ed.addListener( (Ev2 e){ caught++; } );
        ed.addListener( (Ev3 e){ caught++; } );
        
        ed.raise( new Ev1() );
        ed.raise( new Ev2() );
        ed.raise( new Ev3() );
        assert( caught == 4 );
    }
    // TODO: zvetsit tento test
}
