sub init()
    m.movies = m.top.findNode("movies")
    m.movies.content = createObject("roSGNode", "moviesContent")
    m.top.observeField("focusedChild", "onFocusChanged")
end sub

sub onFocusChanged()
    if m.top.hasfocus() = true then
        m.movies.setFocus(true)
    end if
end sub