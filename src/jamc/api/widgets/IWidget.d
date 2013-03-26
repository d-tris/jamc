module jamc.api.widgets.IWidget;

import core.time;
import jamc.api.eventTypes;
import jamc.api.game;
import jamc.util.vector;

interface IWidget
{
    /// Vykreslí element i jeho subelementy
    void    doDraw( int depth );

    
    /// Nastaví pozici elementu vzhledem k rodiči
    @property void position( vec2i position );
    
    /// Získá pozici elementu vzhledem k rodiči
    @property vec2i position() const;
    
    
    /// Nastaví velikost elementu
    @property void size( vec2i size );
    
    /// Vrátí velikost elementu
    @property vec2i size() const;

    
    /// Zjistí, zda se bod \a point nachází uvnitř tohoto elementu
    bool    isPointInside( vec2i point );

    
    /// Nastaví viditelnost elementu
    @property void visible( bool visible );
    
    /// Vrátí viditelnost elementu
    @property bool visible() const;
    
    /// Zjistí, zda je element opravdu viditelný.
    /// Rozdíl proti @property bool visible() je ten, že tato funkce 
    /// vrací false i když je některý z rodičů neviditelný
    bool    isVisible() const;
    
    
    /// Nastaví průhlednost elementu
    void    opacity( float opacity );
    
    /// Získá viditelnost elementu
    float   opacity() const;
    
    /// Postupně prolne průhlednost elementu ze současné průhlednosti
    /// do \a targetOpacity za čas \a dur. \a hideAfterFade určuje, zda
    /// bude element na konci prolnutí skryt.
    void    fadeTo( float targetOpacity, Duration dur, bool hideAfterFade = false );

    
    /// Vrátí rodiče elementu. Může vrátit null pro elementy na nejvyšší 
    /// úrovni.
    @property IWidget parent();

    
    /// Přidá subelement \a newChild do tohoto elementu
    void    addChild( IWidget child );
    
    /// Odebere subelement \a child z tohoto elementu
    void    removeChild( IWidget child );
    
    /// Odstraní všechny subelementy
    void    clearChildren();

    /// Přenese subelement child do popředí
    void    giveFocusTo( IWidget child );


    /**
     * Reaguje na tažení elementu. Element si musí zažádat o tažení
     * pomocí manažeru GUI a metody beginDrag. Tažení lze ukončit opět 
     * pomocí manažeru GUI a metody endDrag.
     * \param delta O kolik se posunula myš
     * \param mb které tlačítko je stisknuto
     */
    void    handleDrag( vec2i delta, Key mb );

    /** 
     * Propaguje a reaguje na stisk nebo uvolnění tlačítka.
     * \param position Pozice myši při kliknutí, relativní k elementu
     * \param mb       Stisknuté/uvolněné tlačítko
     * \param up       Pokud true, tak bylo tlačítko uvolněno, jinak bylo stisknuto
     * \return Zda se má událost kliku propagovat do rodičovského elementu
     */
    bool    handleMouseClick( vec2i position, Key mb, bool up );
    
    /**
     * Propaguje a reaguje na pohyb myši
     * \param position  Současná pozice myši, relativní k elementu
     * \param mouseOver Pokud je false, tak myš vyjela z tohoto elementu
     */
    void    handleMouseMove( vec2i position, bool mouseOver );
    
    /**
     * Reaguje na otočení kolečka myši nad tímto elementem.
     * \param position Pozice myši při otočení, relativní k elementu
     * \param amount   Kolikrát bylo kolečkem otočeno
     */
    void    handleWheel( vec2i position, int amount );
    
    /**
     * Zjišťuje, zda je myš nas tímto elementem
     */
    @property bool mouseOver();
    
    /**
     * Reaguje na text napsaný na klávesnici. Element si musí vyžádat 
     * vstup z klávesnice od manažeru GUI, aby tato funkce měla nějaký
     * efekt.
     * \param text Napsaný text
     */
    void    handleKeyboard( string text );
    
    /**
     * Vrací true pokud tento objekt nějakým způsobem reaguje na vstup
     * z klávesnice.
     */
    @property bool allowKeyboardInput() const;
    
    
    /// Vrací herní kontext
    @property IGame game();
};
