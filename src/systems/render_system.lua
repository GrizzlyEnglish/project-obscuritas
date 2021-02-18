local RenderSystem = tiny.sortedProcessingSystem(class "RenderSystem")

function RenderSystem:init(camera)
    self.camera = camera
    self.filter = tiny.requireAll("sprite", "position")
end

function RenderSystem:preProcess(dt)
    self.camera:apply()
end

function RenderSystem:postProcess(dt)
    self.camera:remove()
end

--[[
    Verify that entities are rendered according to their layers
]]
function RenderSystem:compare(e1, e2)
    return e1.layer < e2.layer
end

function RenderSystem:process(e, dt)
    if e.scale ~= nil then
        love.graphics.scale(e.scale.x, e.scale.y)
    end
    love.graphics.draw(e.sprite, e.position.x, e.position.y)
end

return RenderSystem