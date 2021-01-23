lurker = require('third-party/lurker')

-- Globals
Gamestate = require('third-party/hump/gamestate')

prototype = require('prototype')

if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(prototype)
end