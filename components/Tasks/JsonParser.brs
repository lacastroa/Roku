sub init()
    
end sub

sub getJsonFile()

    fileContent = ReadAsciiFile(m.top.jsonFilePath)
    jsonObject = ParseJson(fileContent)
    m.top.content = jsonObject
end sub