local Character = require 'nodes/level/character'
local EntityLayer = { }

EntityLayer.__index = EntityLayer

function EntityLayer.init()
    local entityLayer = { }

    setmetatable(entityLayer, EntityLayer)

    -- TODO: Move this to a ECS
    entityLayer.entities = { }
    entityLayer.entities[0] = Character:new()

    return entityLayer
end

function EntityLayer:draw()
    for k,ent in pairs(self.entities) do
        ent:draw()
    end
end

function EntityLayer:update(dt)
    for k,ent in pairs(self.entities) do
        ent:update(dt)
    end
end

return EntityLayer