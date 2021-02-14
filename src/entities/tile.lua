local Bounds = require "components/bounds"

--[[

    Tile is the base of the map and
    acts as the grid for the player
    to traverse on

]]
local Tile = class("Tile")

function Tile:init(selfType, x, y)
    -- TODO: rce - Determine where to place width and height
    self.position = Bounds(x, y, Tile.getWidth(), Tile.getHeight())
    self.visible = true
    self.highlighted = false
    -- TODO: rce - Move to a loader system
    self.sprite = love.graphics.newImage('assets/sprites/prototype/tiles/tile_1.png')
    self.is_selected = false
end

function Tile.getWidth()
    return 516
end

function Tile.getHeight()
    return 657
end

return Tile