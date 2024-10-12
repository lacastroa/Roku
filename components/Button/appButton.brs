sub init()
    m.background = m.top.findNode("background")
    m.label = m.top.findNode("label")
    m.padding = 33

    m.top.observeField("focusedChild", "onFocusChanged")
end sub
sub onFocusChanged()

    darkPurple = "0x200726"
    whiteColor = "0xFFFFFF"

    if m.top.hasFocused() = true then
        m.background.color = darkPurple
        m.label.color = whiteColor
    else
        m.background.color = "0xD0BCFE80"
    end if
end sub

sub onTextChanged()
    m.label.text = m.top.text
    labelBoundingRect = m.label.boundingRect()
    width = labelBoundingRect.width + (2 * m.padding)
    m.label.width = width
    m.background.width = width
end sub

function onKeyEvent(key as string, press as boolean) as boolean

    handle = false

    if press = true then
        if key = "OK" then
            m.top.buttonSelected = true
            handle = true
        end if
    end if
end function