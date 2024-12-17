sub init()
    m.background = m.top.findNode("background")
    m.welcomeLabel = m.top.findNode("welcomeLabel")
    m.movies = m.top.findNode("movies")
    m.leftMenu = m.top.findNode("leftMenu")
    m.leftMenu.setFocus(true)

    m.top.observeField("focusedChild", "onFocusChanged")
    m.movies.observeField("focusedChild", "onFocusMoviesChanged")
    m.movies.observeField("ItemFocused", "onItemFocused")
    m.movies.observeField("ItemSelected", "onItemSelected")
end sub


sub onItemFocused(event as object)

end sub

sub onItemSelected(event as object)
    
end sub

sub onFocusChanged()
end sub

sub onFocusMoviesChanged()
    if m.movies.isInFocusChain() then
        m.movies.translation= "[250, 250]"
        m.welcomeLabel.translation= "[250, 100]"
    else if m.leftMenu.isInFocusChain() then
        m.movies.translation= "[500, 250]"
        m.welcomeLabel.translation= "[500, 100]"
    end if

end sub

sub initDataChanged(event as object)
    initData = event.getData()
    if initData <> invalid and initData.name <> invalid then
        m.welcomeLabel.text = "Welcome " + initData.name
    end if
end sub

sub onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press = true then
        ?"-- HomePage --"
        if key = "right" AND m.leftMenu.isInFocusChain() then
            m.leftMenu.visible = false
            m.movies.setFocus(true)
            print "botón derecho"
            handled = true
        else if key = "left" AND m.movies.isInFocusChain() then
            handled = true
            m.leftMenu.visible = true
            m.leftMenu.setFocus(true)
        end if
    end if
    return handled
end sub