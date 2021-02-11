local Bounds = require "components/bounds"

--[[

    Tile is the base of the map and
    acts as the grid for the player
    to traverse on

]]
local Tile = class("Tile")

function Tile:init(selfType, x, y)
    -- TODO: rce - Determine where to place width and height
    self.position = Bounds(x, y, 516, 657)
    self.visible = true
    self.highlighted = false
    self.image = nil
end

return Tile