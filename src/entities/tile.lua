local Bounds = require "components/bounds"

--[[

    Tile is the base of the map and
    acts as the grid for the player
    to traverse on

]]
local Tile = class("Tile")

function Tile:init(selfType, x, y)
    -- TODO: rce - Move to a loader system
    self.sprite = love.graphics.newImage('assets/sprites/prototype/tiles/tile_1.png')
    self.position = Bounds(x, y, self.sprite:getWidth(), self.sprite:getHeight())
    self.visible = true
    self.highlighted = false
    self.is_selected = false
    self.layer = 0
end

return Tile