local Bounds = class("Bounds")

function Bounds:init(x, y, width, height)
    self.x = x
    self.y = y
    self.lx = x
    self.ty = y
    self.width = width
    self.height = height
    self.rx = x + width
    self.by = y + height
end

function Bounds:inBounds(x, y)
    return x >= self.lx and x <= self.rx and y <= self.by and y >= self.ty
end

return Bounds