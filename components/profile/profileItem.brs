sub init()
    m.backgroundItem = m.top.findNode("backgroundItem")
    m.button = m.top.findNode("profileButton")
    m.poster = m.top.findNode("posterProfile")
    m.button = m.top.findNode("profileButton")

    m.top.observeField("focusedChild", "onFocusItemChanged")
end sub

sub onFocusItemChanged()
    print "the ", m.top.id, " has the focus ", m.top.hasFocus()
    darkPurple = "0x200726"

    if m.top.hasFocus() = true then
        m.backgroundItem.color = darkPurple

        m.button.setFocus(true)

    else
        m.backgroundItem.color = "0xD0BCFE80"
    end if
end sub

sub onTextButtonChanged()
    m.button.text = m.top.text
end sub

sub onUriChanged()
    m.poster.uri = m.top.uri
end sub


