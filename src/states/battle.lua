local Camera = require 'third-party/gamera'

local Battle = class("Battle")

local RenderSystem = require 'systems/render_system'
local TileSelectionSystem = require 'systems/tile_selection_system'
local Tile = require 'entities/tile'
local Bat = require 'entities/bat'

function Battle:init()
    local world = tiny.world()
    local tiles = generateTiles(15, world)

    self.camera = Camera.new(0, 0, 10000, 10000)
    self.camera:setScale(0.1)

    world:addSystem(TileSelectionSystem())
    world:addSystem(RenderSystem(self.camera))

    -- TODO: Create a spawner to handle determining who to spawn, for now just testing
    world:add(Bat(0, 0))

    _G.world = world
    _G.camera = self.camera
end

function generateTiles(size, world)
    local tiles = { }

    local x, y = 0, 0

    for i=0,size do
        tiles[i] = { }
        local t = { }
        for j=0,size do
            t = Tile("dungeon", x, y)
            x = x + t.sprite:getWidth()
            world:add(t)
        end
        y = y + (t.sprite:getHeight() * .65)
        if i % 2 == 0 then
            x = (t.sprite:getWidth() / 2)
        else 
            x = 0
        end
    end

    return tiles
end

function Battle:draw()
    world:update(love.timer.getDelta())
end

function love.mousereleased(x, y, button, istouch, presses)
    local mouseX, mouseY = camera:toWorld(x, y)
    world.mouse_input = {
        x = mouseX,
        y = mouseY,
        button = button,
        istouch = istouch,
        presses = presses
    }
end

return Battle