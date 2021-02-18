local Bounds = require "components/bounds"

local Bat = class("Bat")

function Bat:init(x, y)
    -- TODO: rce - Move to a loader system
    self.sprite = love.graphics.newImage('assets/sprites/prototype/characters/bat.png')
    self.position = Bounds(x, y, self.sprite:getWidth(), self.sprite:getHeight())
    self.visible = true
    self.is_selected = false
    -- TODO: Determine if this is the best way to determine who are the "figures" on the board
    self.stats = { }
    self.layer = 10
    self.scale = { x = .8, y = .9 }
end

return Bat