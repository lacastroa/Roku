sub init()
    m.done = false
    m.jsonParser = createObject("roSGNode", "JsonParser")
    m.jsonParser.functionName = "getJsonFile"
    m.jsonParser.jsonFilePath = "pkg:/source/json/profiles.json"
    m.jsonParser.observeField("content", "setContent")

    m.jsonParser.control = "run"
    ?"CREANDO PROFILE SCENE"
    m.profileItem1=m.top.findNode("profileItem1")
    m.profileItem2=m.top.findNode("profileItem2")
    m.profileItem3=m.top.findNode("profileItem3")
    m.profileItem4=m.top.findNode("profileItem4")

    m.top.observeField("focusedChild", "onFocusItemChanged")
    m.lastFocused = "profileItem1"
end sub


sub setContent()
    m.content = m.jsonParser.content
    m.jsonParser.control = "stop"

    m.profileItem1.text = m.content[0].name
    m.profileItem2.text = m.content[1].name
    m.profileItem3.text = m.content[2].name
    m.profileItem4.text = m.content[3].name

    m.profileItem1.uri = m.content[0].imagePath
    m.profileItem2.uri = m.content[1].imagePath
    m.profileItem3.uri = m.content[2].imagePath
    m.profileItem4.uri = m.content[3].imagePath
    if m.done = false then
        m.done = true
    end if
end sub


sub onFocusItemChanged()
    ?"PROFILE SCENE", m.top.hasFocus()
    if m.top.hasFocus() then
        m[m.lastFocused].setFocus(true)
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
                m.lastFocused = "profileItem2"
                handled = true

            else if m.profileItem2.isInFocusChain() = true then
                ?"PROFILE 3 RIGHT"

                m.profileItem3.setFocus(true)
                m.lastFocused = "profileItem3"
                handled = true

            else if m.profileItem3.isInFocusChain() = true then
                ?"PROFILE 4 RIGHT"
                m.profileItem4.setFocus(true)
                m.lastFocused = "profileItem4"
                handled = true
            end if
        else if key = "left" then
            if m.profileItem4.isInFocusChain() = true then
                ?"PROFILE 3 LEFT"
                m.profileItem3.setFocus(true)
                m.lastFocused = "profileItem3"
                handled = true

            else if m.profileItem3.isInFocusChain() = true then
                ?"PROFILE 2 LEFT"
                m.profileItem2.setFocus(true)
                m.lastFocused = "profileItem2"
                handled = true

            else if m.profileItem2.isInFocusChain() = true then
                ?"PROFILE 1 LEFT"
                m.profileItem1.setFocus(true)
                m.lastFocused = "profileItem1"
                handled = true
            end if
        end if
    end if
    return handled
end function
