local gamera = require 'third-party/gamera'
local map = require 'nodes/level/map'

prototype = {}

function prototype:init()
    self.map = map.new("dungeon", 12)
    self.camera = gamera.new(self.map:getBounds())
    self.camera:setScale(3.0)
end

function prototype:draw()
    self.camera:draw(function(l,t,w,h)
        self.map:draw()
    end)
end

function prototype:update(dt)
    local x,y = self.camera:getPosition()
    local yDiff,xDiff = 0,0

    if love.keyboard.isDown("z") then
        self.camera:setScale(self.camera:getScale() - .1)
    elseif love.keyboard.isDown("x") then
        self.camera:setScale(self.camera:getScale() + .1)
    end

    if love.keyboard.isDown("up", "w") then
        yDiff = -15
    elseif love.keyboard.isDown("down", "s") then
        yDiff = 15
    end

    if love.keyboard.isDown("left", "a") then
        xDiff = -15
    elseif love.keyboard.isDown("right", "d") then
        xDiff = 15
    end

    self.camera:setPosition(x + xDiff, y + yDiff)
    self.map:update(dt)
end

function prototype:mouseInput()
    local mouseX, mouseY = love.mouse.getPosition()
    mouseX, mouseY = self.camera:toWorld(mouseX, mouseY)

    self.map:mouseInput(mouseX, mouseY)
end

function love.mousepressed(x, y, button)
    if button == 1 then
        prototype:mouseInput()
    end
end

return prototype