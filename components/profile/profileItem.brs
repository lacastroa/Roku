sub init()
    m.backgroundItem = m.top.findNode("backgroundItem")
    m.button = m.top.findNode("profileButton")
    m.poster = m.top.findNode("posterProfile")

    m.top.observeField("focusedChild", "onFocusItemChanged")
end sub

sub onFocusItemChanged()

    darkPurple = "0x200726"

    if m.top.hasFocused() = true then
        m.backgroundItem.color = darkPurple
    else
        m.background.color = "0xD0BCFE80"
    end if
end sub

sub onTextButtonChanged()
    m.button.text = m.top.text
end sub

sub onUriChanged()
    m.poster.uri = m.top.uri
end sub


