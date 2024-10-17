sub init()
    ?"CREANDO PROFILE SCENE"
    m.profileItem1=m.top.findNode("profileItem1")
    m.profileItem2=m.top.findNode("profileItem2")
    m.profileItem3=m.top.findNode("profileItem3")
    m.profileItem4=m.top.findNode("profileItem4")

    m.top.observeField("focusedChild", "onFocusItemChanged")
end sub

sub onFocusItemChanged()
    ?"PROFILE SCENE", m.top.hasFocus()
    if m.top.hasFocus()
        m.profileItem1.setFocus(true)
    end if
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    print "onKeyEventProfileScene  " key, press
    handled = false

    if press = true then
        if key = "right" then
            if m.profileItem1.isInFocusChain() = true then
                ?"PROFILE 2 RIGHT"
                m.profileItem2.setFocus(true)
                handled = true

            else if m.profileItem2.isInFocusChain() = true then
                ?"PROFILE 3 RIGHT"

                m.profileItem3.setFocus(true)
                handled = true

            else if m.profileItem3.isInFocusChain() = true then
                ?"PROFILE 4 RIGHT"
                m.profileItem4.setFocus(true)
                handled = true
            end if
        else if key = "left" then
            if m.profileItem4.isInFocusChain() = true then
                ?"PROFILE 3 LEFT"
                m.profileItem3.setFocus(true)
                handled = true

            else if m.profileItem3.isInFocusChain() = true then
                ?"PROFILE 2 LEFT"
                m.profileItem2.setFocus(true)
                handled = true

            else if m.profileItem2.isInFocusChain() = true then
                ?"PROFILE 1 LEFT"
                m.profileItem1.setFocus(true)
                handled = true
            end if
        end if
    end if
    return handled
end function
