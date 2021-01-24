local Level = { }

local Tile = require 'nodes/level/tile'
local TileLayer = require 'scenes/level/layers/tile_layer'
local TileHighlightLayer = require 'scenes/level/layers/tile_highlight_layer'
local EntityLayer = require 'scenes/level/layers/entity_layer'

local Camera = require 'third-party/gamera'

function Level:init()
    local levelSize = math.random(9, 15)

    -- Set the size of the level
    self.levelSize = levelSize

    -- Setup the layers
    self.layers = { }
    -- First is the tile layer that is the "grid"
    self.layers["tiles"] = TileLayer.init("dungeon", levelSize)
    -- Next is tile highlighting
    self.layers["highlight"] = TileHighlightLayer.init()
    -- Next is entity layer
    self.layers["entity"] = EntityLayer.init()
    -- Last is UI

    -- TODO: Rce - Fix this to actually get the bounds
    self.camera = Camera.new(-100, -100, 1000, 1000)
    self.camera:setScale(3.0)
end

function Level:getLayer(layerName)
    return self.layers[layerName]
end

function Level:update(dt)
    -- Update the Camera if needed
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

    -- TODO: Determine if there is a better way to handle this
    self.layers["tiles"]:update(dt)
    -- Next is tile highlighting
    self.layers["highlight"]:update(dt)
    -- Next is entity layer
    self.layers["entity"]:update(dt)
end

function Level:handleMouseInput()
    local mouseX, mouseY = love.mouse.getPosition()
    mouseX, mouseY = self.camera:toWorld(mouseX, mouseY)

    self:getLayer("tiles"):mouseInput(mouseX, mouseY)
end

function love.mousepressed(x, y, button)
    if button == 1 then
        Level:handleMouseInput()
    end
end

function Level:draw()
    self.camera:draw(function(l,t,w,h)
        -- TODO: Determine if there is a better way to handle this
        self.layers["tiles"]:draw()
        -- Next is tile highlighting
        self.layers["highlight"]:draw()
        -- Next is entity layer
        self.layers["entity"]:draw()
    end)
end

return Level