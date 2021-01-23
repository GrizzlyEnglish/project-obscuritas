local Tile = require 'nodes/level/tile'
local Character = require 'nodes/level/character'
local Map = {}

Map.__index = Map

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

function Map.new(mapType, size)
    local map = {}

    setmetatable(map, Map)

    map.mapType = mapType
    map.size = size
    map.tiles = generateTiles(mapType, size)
    map.character = Character:new()

    return map
end

function Map:update(dt)
    for i=1,self.size do
        for j=1,self.size do
            self.tiles[i][j]:update(dt)
        end
    end

    self.character:update(dt)
end

function Map:mouseInput(mouseX, mouseY)
    for i=1,self.size do
        for j=1,self.size do
            self.tiles[i][j]:checkSelected(mouseX, mouseY)
        end
    end
end

function Map:draw()
    for i=1,self.size do
        for j=1,self.size do
            self.tiles[i][j]:draw()
        end
    end

    for i=1,self.size do
        for j=1,self.size do
            local tile = self.tiles[i][j]
            if tile.is_highlighted then
                love.graphics.rectangle("line", tile.lx, tile.ty, 16, 16)
            end
        end
    end

    self.character:draw()
end

function Map:getTiles()
    return self.tiles
end

function Map:getBounds()    
    local tileWidth = Tile:getWidth()
    local tileHieght = Tile:getHeight()

    return -(tileWidth * 2), -(tileHieght * 2), (tileWidth * self.size), (tileHieght * self.size)
end

return Map