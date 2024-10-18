sub centerNodeHorizontally(node as dynamic)
    XPos = (1920 - node.boundingRect().width) / 2
    node.translation = [XPos, 600]
end sub