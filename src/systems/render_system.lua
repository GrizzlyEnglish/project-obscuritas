local RenderSystem = tiny.processingSystem(class "RenderSystem")

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

function RenderSystem:process(e, dt)
    love.graphics.draw(e.sprite, e.position.x, e.position.y)
end

return RenderSystem