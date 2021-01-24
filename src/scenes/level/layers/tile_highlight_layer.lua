local TileHighlightLayer = { }

TileHighlightLayer.__index = TileHighlightLayer

function TileHighlightLayer.init()
    local tileHighlight = { }

    setmetatable(tileHighlight, TileHighlightLayer)

    -- An array of highlighted tiles to loop and draw
    tileHighlight.tiles = { }

    return tileHighlight
end 

function TileHighlightLayer:highlightTiles(tiles, color)
    self:clearTiles()
    local index = 0
    for k,v in tiles do
        self.tiles[index] = {
            tile = v,
            color = color
        }
        index = index + 1
    end
end

function TileHighlightLayer:clearTiles()
    tileHighlight.tiles = { }
end

function TileHighlightLayer:draw()
    for k,tileHighlight in pairs(self.tiles) do
        local tile = tileHighlight.tile
        love.graphics.setColor(1, 0, 0)
        love.graphics.rectangle("line", tile.lx, tile.ty, 16, 16)
    end
end

function TileHighlightLayer:update(dt)
end

return TileHighlightLayer