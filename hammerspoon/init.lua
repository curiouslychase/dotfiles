local hyper = {"cmd", "alt", "ctrl"}

-- this is a work in progress configuration for hammerspoon.
-- I'm brand newish to hammerspoon and still very green at Lua,
-- so take this configuration with a grain of salt.
function shiftLeft()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.w = max.w / 2
    f.h = max.h
    f.x = max.x
    f.y = max.y
    win:setFrame(f, 0)
end

hs.hotkey.bind(hyper, "Left", shiftLeft)

function shiftRight()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.w = max.w / 2
    f.h = max.h 
    f.x = max.x + f.w
    f.y = max.y 
    win:setFrame(f, 0)
end

hs.hotkey.bind(hyper, "Right", shiftRight)

function shiftTop()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.w = max.w 
    f.h = max.h / 2
    f.x = max.x 
    f.y = max.y
    win:setFrame(f, 0)
end

hs.hotkey.bind(hyper, "Up", shiftTop)

function shiftBottom()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.w = max.w 
    f.h = max.h / 2
    f.x = max.x 
    f.y = max.y + f.h
    win:setFrame(f, 0)
end

hs.hotkey.bind(hyper, "Down", shiftBottom)

function shiftTopLeft()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.w = max.w / 2
    f.h = max.h / 2
    f.x = max.x 
    f.y = max.y 
    win:setFrame(f, 0)
end

hs.hotkey.bind(hyper, "1", shiftTopLeft)

function shiftTopRight()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.w = max.w / 2
    f.h = max.h / 2
    f.x = max.x + f.w
    f.y = max.y 
    win:setFrame(f, 0)
end

hs.hotkey.bind(hyper, "2", shiftTopRight)

function shiftBottomLeft()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.w = max.w / 2
    f.h = max.h / 2
    f.x = max.x 
    f.y = max.y + f.h
    win:setFrame(f, 0)
end

hs.hotkey.bind(hyper, "3", shiftBottomLeft)

function shiftBottomRight()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.w = max.w / 2
    f.h = max.h / 2
    f.x = max.x + f.w
    f.y = max.y + f.h
    win:setFrame(f, 0)
end

hs.hotkey.bind(hyper, "4", shiftBottomRight)

function maximizeWindow()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.w = max.w 
    f.h = max.h 
    f.x = max.x 
    f.y = max.y 
    win:setFrame(f, 0)
end

hs.hotkey.bind(hyper, "M", maximizeWindow)

-- reload config dynamically when the file changes
function reloadConfig(files)
    shouldReload = false
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            shouldReload = true
        end
    end
    if shouldReload then
        hs.reload()
    end
end

dotfilesLuaWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/src/gitlab.com/chaseadamsio/dotfiles/", reloadConfig):start()
hs.notify.new({title="Hammerspoon", informativeText="Reloaded Config"}):send()