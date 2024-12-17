sub init()
    m.posterImage = m.top.findNode("posterImage")
    m.posterLabel = m.top.findNode("posterLabel")
end sub

sub showContent()
    itemcontent = m.top.itemContent
    m.posterImage.uri = itemcontent.HDPosterUrl
    m.posterLabel.text = itemcontent.title
end sub