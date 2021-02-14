local TileSelectionSystem = tiny.processingSystem(class "TileSelectionSystem")

function TileSelectionSystem:filter(entity)
    return entity.class.name == "Tile"
end

function TileSelectionSystem:process(e, dt)
    e.is_selected = world.mouse_input ~= nil and e.position:inBounds(world.mouse_input.x, world.mouse_input.y)
    if e.is_selected then
        print("Selected tile at ("..e.position.x..","..e.position.y..")")
        world.mouse_input = nil
    end
end

return TileSelectionSystem