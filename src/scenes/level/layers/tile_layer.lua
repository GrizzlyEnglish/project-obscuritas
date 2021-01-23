local Tile = require 'nodes/level/tile'
local TileLayer = {}

TileLayer.__index = TileLayer

function TileLayer.init(maptype)
    local layer = {}

    setmetatable(layer, TileLayer)

    local mapSize = math.random(9, 15)

    self.tiles = generateTiles(mapType, mapSize)

    return layer
end

function TileLayer:update(dt)
    for i=1,self.size do
        for j=1,self.size do
            self.tiles[i][j]:update(dt)
        end
    end
end

function TileLayer:draw()
    for i=1,self.size do
        for j=1,self.size do
            self.tiles[i][j]:draw()
        end
    end
end

function generateTiles(maptype, size)
    local tiles = { }

    local x, y = 0, 0

    for i=1,size do
        tiles[i] = { }
        for j=1,size do
            tiles[i][j] = Tile.new(maptype, x, y)
            y = y + Tile:getHeight()
        end
        x = x + Tile:getWidth()
        y = 0
    end

    return tiles
end

return TileLayer