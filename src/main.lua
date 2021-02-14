-- Globals
class = require 'third-party/30log'
lurker = require 'third-party/lurker'
Gamestate = require 'third-party/hump/gamestate'
tiny = require 'third-party/tiny'

battle = require 'states/battle'

if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(battle)
end