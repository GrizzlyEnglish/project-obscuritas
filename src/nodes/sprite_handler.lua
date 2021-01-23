local SpriteHandler = {}

function SpriteHandler:loadTile(tileType)
    if tileType == "dungeon" then
        return self:loadDungeonTile()
    end
end

function SpriteHandler:loadDungeonTile()
    local basePath = 'assets/sprites/prototype/tiles/floor_'
    local variant = math.random(1, 2)
    local path = basePath .. variant .. '.png'
    
    return self:loadSprite(path)
end

function SpriteHandler:loadCharacter()
    local path = 'assets/sprites/prototype/characters/knight_idle_spritesheet.png'

    return self:loadSprite(path)
end

function SpriteHandler:loadSprite(path)
    if self[path] == nil then
        print("Loaded sprite path" .. path)
        self[path] = love.graphics.newImage(path)
    end

    return self[path]
end

return SpriteHandler