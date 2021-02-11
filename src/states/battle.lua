local Camera = require 'third-party/gamera'

local Battle = class("Battle")

function Battle:init()
    self.camera = Camera.new(0, 0, 1000, 1000)
    self.camera:setScale(0.1)
end

function Battle:load()
end

function Battle:draw()
    self.camera:draw(function(l,t,w,h)
    end)
end

return Battle