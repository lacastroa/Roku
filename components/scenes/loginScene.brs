sub init()
    m.keyboard = createObject("roSgNode", "Keyboard")
    m.keyboard.id = "keyboard"
    m.keyboard.visible = false
    m.keyboard.showTextEditBox = false

    m.top.appendChild(m.keyboard)
    centerNodeHorizontally(m.keyboard)
    m.keyboard.textEditBox.observeField("cursorPosition", "onCursorPositionChanged")
    m.keyboard.observeField("text", "onKeyboardTextChanged")

    m.email = m.top.findNode("email")
    m.password = m.top.findNode("password")
    m.button = m.top.findNode("button")
    m.top.observeField("focusedChild", "onFocusChanged")
end sub

sub onCursorPositionChanged()
    if m.keyboard.visible then
        m[m.activeInput].cursorPosition = m.keyboard.textEditBox.cursorPosition
    end if
end sub

sub onKeyboardTextChanged()
    if m.keyboard.visible then
        m[m.activeInput].text = m.keyboard.text
    end if
end sub

sub onFocusChanged()
    if m.top.hasFocus() then
        m.email.setFocus(true)
    end if
end sub

function onKeyEvent(key as string, press as boolean) as Boolean
    print "LOGIN SCENE >>key "; key; " >>press "; press

    handled = false
    if press = true then
        if key = "back" and m.keyboard.visible then
            m.keyboard.visible = false
            m.keyboard.text = ""
            m[m.activeInput].setFocus(true)
            handled = true
        else if key = "OK" then
            handleOKPressed()
        else if key = "up" and m.password.hasFocus() then
            m.email.setFocus(true)
            m.email.active = true
            m.password.active = false
            handled = true
        else if key = "up" and m.button.hasFocus() then
            m.password.setFocus(true)
            m.password.active = true
        else if key = "down" and m.email.hasFocus() then
            m.password.setFocus(true)
            m.password.active = true
            m.email.active = false
            handled = true
        else if key = "down" and m.password.hasFocus() then
            m.password.active = false
            m.button.setFocus(true)
        end if
    end if
    return handled
end function

sub handleOKPressed()
    if m.email.hasFocus() then
        m.activeInput = "email"
        m.keyboard.visible = true
        m.keyboard.setFocus(true)
    else if m.password.hasFocus() then
        m.activeInput = "password"
        m.keyboard.visible = true
        m.keyboard.setFocus(true)
    end if
end sub