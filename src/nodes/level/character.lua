local SpriteHandler = require 'nodes/sprite_handler'
local anim8 = require 'third-party/anim8'

local Character = { }

Character.__index = Character

function Character.new()
    local character = { }

    setmetatable(character, Character)

    character.image = SpriteHandler:loadCharacter()
    local g = anim8.newGrid(16, 16, character.image:getWidth(), character.image:getHeight())
    character.animation = anim8.newAnimation(g('1-6',1), .1)

    character.x = 0
    character.y = 0

    return character
end

function Character:update(dt)
    self.animation:update(dt)
end

function Character:draw()
    self.animation:draw(self.image, self.x, self.y)
end

return Character