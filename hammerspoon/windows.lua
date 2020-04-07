hs.window.animationDuration = 0

-- to log:
-- hs.logger.new('windows'):e('message string', variable)

-- +-----------------+
-- |        |        |
-- |  HERE  |        |
-- |        |        |
-- +-----------------+
function hs.window.left(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  hs.logger.new('windows'):e('width', max.w)

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

-- +-----------------+
-- |        |        |
-- |        |  HERE  |
-- |        |        |
-- +-----------------+
function hs.window.right(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

-- +-----------------+
-- |      HERE       |
-- +-----------------+
-- |                 |
-- +-----------------+
function hs.window.up(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.w = max.w
  f.y = max.y
  f.h = max.h / 2
  win:setFrame(f)
end

-- +-----------------+
-- |                 |
-- +-----------------+
-- |      HERE       |
-- +-----------------+
function hs.window.down(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.w = max.w
  f.y = max.y + (max.h / 2)
  f.h = max.h / 2
  win:setFrame(f)
end

-- +-----------------+
-- |  HERE  |        |
-- +--------+        |
-- |                 |
-- +-----------------+
function hs.window.upLeft(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:fullFrame()

  f.x = max.x
  f.y = max.y
  f.w = max.w/2
  f.h = max.h/2
  win:setFrame(f)
end

-- +-----------------+
-- |                 |
-- +--------+        |
-- |  HERE  |        |
-- +-----------------+
function hs.window.downLeft(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:fullFrame()

  f.x = max.x
  f.y = max.y + (max.h / 2)
  f.w = max.w/2
  f.h = max.h/2
  win:setFrame(f)
end

-- +-----------------+
-- +--------+        |
-- |  HERE  |        |
-- |        |        |
-- +-----------------+
function hs.window.downLeftTall(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:fullFrame()

  f.x = max.x
  f.y = max.y + (max.h * 0.3)
  f.w = max.w/2
  f.h = max.h * 0.7
  win:setFrame(f)
end

-- +-----------------+
-- |                 |
-- |        +--------|
-- |        |  HERE  |
-- +-----------------+
function hs.window.downRight(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:fullFrame()

  f.x = max.x + (max.w / 2)
  f.y = max.y + (max.h / 2)
  f.w = max.w/2
  f.h = max.h/2

  win:setFrame(f)
end

-- +-----------------+
-- |        |  HERE  |
-- |        +--------|
-- |                 |
-- +-----------------+
function hs.window.upRight(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:fullFrame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w/2
  f.h = max.h/2
  win:setFrame(f)
end

-- +--------------+
-- |  |        |  |
-- |  |  HERE  |  |
-- |  |        |  |
-- +---------------+
function hs.window.centerWithFullHeight(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:fullFrame()

  f.x = max.x + (max.w / 5)
  f.w = max.w * 3/5
  f.y = max.y
  f.h = max.h
  win:setFrame(f)
end

-- +-----------------+
-- |      |          |
-- | HERE |          |
-- |      |          |
-- +-----------------+
function hs.window.left40(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w * 0.4
  f.h = max.h
  win:setFrame(f)
end

-- +-----------------+
-- |      |          |
-- |      |   HERE   |
-- |      |          |
-- +-----------------+
function hs.window.right60(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w * 0.4)
  f.y = max.y
  f.w = max.w * 0.6
  f.h = max.h
  win:setFrame(f)
end

-- +-----------------+
-- |  ?    ,-----, ? |
-- |     ? |HERE |   |
-- |   ?   `-----`  ?|
-- +-----------------+
function hs.window.fuzzy(win)
  -- An hs.geometry rect containing the co-ordinates of the top left corner
  -- of the window and its width and height
  local f = win:frame()

  -- An hs.screen object representing the screen which most contains the window (by area)
  local screen = win:screen()

  -- an hs.geometry rect describing this screen's "usable" frame
  -- (i.e. without the dock and menu bar) in absolute coordinates
  local max = screen:frame()

---------------------------------
-- @TODO
-- let's change this to:
-- 90% of height of screen
-- 60% of the width of the screen
---------------------------------

-- first, set our window to the correct size,
-- i.e. ~80% the size of our screen
  f.w = max.w * 0.70
  f.h = max.h * 0.85
  
  hs.logger.new('windows'):e('max width ', max.w)
  hs.logger.new('windows'):e('max height ', max.h)
  hs.logger.new('windows'):e('aspect ', max.w / max.h)
  hs.logger.new('windows'):e('screen ', screen)

-- next, put it in a random location, with some padding
-- remaining around the borders (that's what the the `50` is for)

  local maxX = (max.w - f.w) * 0.95
  local maxY = (max.h - f.h) * 0.95

  local minX = (max.w - f.w) * 0.05
  local minY = (max.h - f.h) * 0.05


  f.x = math.random(math.floor(minX), math.floor(maxX))
  f.y = math.random(math.floor(minY), math.floor(maxY))





  -- local maxX = max.w - ((max.w * 0.75) - 50)
  -- local maxY = max.h - ((max.h * 0.85) - 50)

  -- f.x = math.random(0, math.floor(maxX))
  -- f.y = math.random(0, math.floor(maxY))

  -- hs.logger.new('windows'):e('f.x ', f.x)
  -- hs.logger.new('windows'):e('maxX ', maxX)
  -- hs.logger.new('windows'):e('f.y ', f.y)
  -- hs.logger.new('windows'):e('maxY ', maxY)
  -- hs.logger.new('windows'):e('max.w ', max.w)
  -- hs.logger.new('windows'):e('max.h ', max.h)
  -- hs.logger.new('windows'):e('max.x ', max.x)
  -- hs.logger.new('windows'):e('max.y ', max.y)

  win:setFrame(f)
end

-- +------------------------------+
-- |  ?     ?          ?        ? |
-- |  .-----------------------,   |
-- |? |                       | ? |
-- |  |         HERE          |   |
-- |  |                       |  ?|
-- | ?`-----------------------`?  |
-- +------------------------------+
function hs.window.bigFuzzy(win)
  -- An hs.geometry rect containing the co-ordinates of the top left corner
  -- of the window and its width and height
  local f = win:frame()

  -- An hs.screen object representing the screen
  -- which most contains the window (by area)
  local screen = win:screen()

  -- an hs.geometry rect describing this screen's "usable" frame
  -- (i.e. without the dock and menu bar) in absolute coordinates
  local max = screen:frame()

  -- first, set our window to the correct size,
  -- i.e. ~95% the size of our screen
  f.w = max.w * 0.96
  f.h = max.h * 0.96

  -- next, put it in a random location, with some padding
  -- remaining around the borders (that's what the the `50` is for)
  --
  -- NOTE for some reason, it's not taking into account the menu bar,
  -- so I'm accounting for it with a 23-point buffer

  -- get our maximum x & y values
  local maxX = max.w - f.w
  local maxY = max.h - f.h

  -- now calculate the max x & y values for our position range
  -- (i.e. make sure to leave a bit of a buffer around the edge of the screen)
  local maxDesiredX = (maxX) * 0.96
  local maxDesiredY = ((maxY) * 0.96) + 23
  local minDesiredX = (max.w - f.w) * 0.04
  local minDesiredY = ((max.h - f.h) * 0.04) + 23

  -- now, using our desired position ranges, create a random location
  f.x = math.random(math.floor(minDesiredX), math.floor(maxDesiredX))
  f.y = math.random(math.floor(minDesiredY), math.floor(maxDesiredY))

  win:setFrame(f)
end

function hs.window.nextScreen(win)
  local currentScreen = win:screen()
  local allScreens = hs.screen.allScreens()
  currentScreenIndex = hs.fnutils.indexOf(allScreens, currentScreen)
  nextScreenIndex = currentScreenIndex + 1

  if allScreens[nextScreenIndex] then
    win:moveToScreen(allScreens[nextScreenIndex])
  else
    win:moveToScreen(allScreens[1])
  end
end

windowLayoutMode = hs.hotkey.modal.new({}, 'F16')

windowLayoutMode.entered = function()
  windowLayoutMode.statusMessage:show()
end
windowLayoutMode.exited = function()
  windowLayoutMode.statusMessage:hide()
end

-- Bind the given key to call the given function and exit WindowLayout mode
function windowLayoutMode.bindWithAutomaticExit(mode, modifiers, key, fn)
  mode:bind(modifiers, key, function()
    mode:exit()
    fn()
  end)
end

local status, windowMappings = pcall(require, 'keyboard.windows-bindings')

if not status then
  windowMappings = require('keyboard.windows-bindings-defaults')
end

local modifiers = windowMappings.modifiers
local showHelp  = windowMappings.showHelp
local trigger   = windowMappings.trigger
local mappings  = windowMappings.mappings

function getModifiersStr(modifiers)
  local modMap = { shift = '⇧', ctrl = '⌃', alt = '⌥', cmd = '⌘' }
  local retVal = ''

  for i, v in ipairs(modifiers) do
    retVal = retVal .. modMap[v]
  end

  return retVal
end

local msgStr = getModifiersStr(modifiers)
msgStr = 'Window Layout Mode (' .. msgStr .. (string.len(msgStr) > 0 and '+' or '') .. trigger .. ')'

for i, mapping in ipairs(mappings) do
  local modifiers, trigger, winFunction = table.unpack(mapping)
  local hotKeyStr = getModifiersStr(modifiers)

  if showHelp == true then
    if string.len(hotKeyStr) > 0 then
      msgStr = msgStr .. (string.format('\n%10s+%s => %s', hotKeyStr, trigger, winFunction))
    else
      msgStr = msgStr .. (string.format('\n%11s => %s', trigger, winFunction))
    end
  end

  windowLayoutMode:bindWithAutomaticExit(modifiers, trigger, function()
    --example: hs.window.focusedWindow():upRight()
    local fw = hs.window.focusedWindow()
    fw[winFunction](fw)
  end)
end

local message = require('keyboard.status-message')
windowLayoutMode.statusMessage = message.new(msgStr)

-- Use modifiers+trigger to toggle WindowLayout Mode
hs.hotkey.bind(modifiers, trigger, function()
  windowLayoutMode:enter()
end)
windowLayoutMode:bind(modifiers, trigger, function()
  windowLayoutMode:exit()
end)
