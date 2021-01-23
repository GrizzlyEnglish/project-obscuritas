local SpriteHandler = require 'nodes/sprite_handler'

local Tile = {}

Tile.__index = Tile

--[[
    Generates a tile for the map
]]
function Tile.new(tileType, x, y)
    local tile = {}

    setmetatable(tile, Tile)

    tile.lx = x
    tile.rx = x + Tile.getWidth()
    tile.ty = y
    tile.by = y + Tile.getHeight()
    tile.is_visible = true
    tile.is_highlighted = false

    tile.image = SpriteHandler:loadTile(tileType)

    return tile
end

function Tile:draw()
    if self.is_visible then
        love.graphics.draw(self.image, self.lx, self.ty)
    end
end

function Tile:update(dt)
end

function Tile:checkSelected(mouseX, mouseY)
    if self:inBounds(mouseX, mouseY) then
        self.is_highlighted = not self.is_highlighted
    end
end

function Tile:inBounds(mouseX, mouseY)
    return mouseX >= self.lx and mouseX <= self.rx and mouseY >= self.ty and mouseY <= self.by
end

function Tile:getPosition()
    return self.lx, self.ty
end

-- TODO: Rce - Move this to a confi section
function Tile.getWidth()
    return 16
end

-- TODO: Rce - Move this to a confi section
function Tile.getHeight()
    return 16
end

return Tile