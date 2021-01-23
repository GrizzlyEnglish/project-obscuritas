local Level = { }

local TileLayer = require 'scenes/level/layers/tile_layer'

Level.__index = Level

function Level.init(levelType)
    local level = { }

    setmetatable(level, Level)

    -- Setup the layers
    level.layers = { }
    -- First is the tile layer that is the "grid"
    level.layers[0] = TileLayer.init(levelType)
    -- Next is tile highlighting
    level.layers[1] = TileHighlight.init()
    -- Next is entity layer
    level.layers[2] = EntityLayer.init()
    -- Last is UI

    return level
end

function Level:update(dt)
    for k,v in self.layers do
        v:update(dt)
    end
end

function Level:draw()
    for k,v in self.layers do
        v:draw()
    end
end

return Level