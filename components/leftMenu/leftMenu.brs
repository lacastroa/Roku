sub init()
    m.categories = m.top.findNode("categories")
    m.top.observeField("focusedChild", "onFocusChanged")
end sub

sub onFocusChanged()
    if m.top.hasFocus() then
        m.categories.setFocus(true)
    end if
end sub