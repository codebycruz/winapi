local ffi = require("ffi")
local winapi = require("winapi")

local running = true
local mouseX, mouseY = 0, 0
local keysPressed = {}

-- Window procedure to handle messages
local function windowProc(hwnd, msg, wparam, lparam)
	if msg == winapi.user32.WM.DESTROY then
		running = false
		winapi.user32.postQuitMessage(0)
		return 0
	elseif msg == winapi.user32.WM.KEYDOWN then
		local vk = tonumber(winapi.user32.LOWORD(wparam))
		keysPressed[vk] = true

		-- ESC to exit
		if vk == winapi.user32.VK.ESCAPE then
			winapi.user32.destroyWindow(hwnd)
		end
		return 0
	elseif msg == winapi.user32.WM.KEYUP then
		local vk = tonumber(winapi.user32.LOWORD(wparam))
		keysPressed[vk] = false
		return 0
	elseif msg == winapi.user32.WM.MOUSEMOVE then
		mouseX = winapi.user32.GET_X_LPARAM(lparam)
		mouseY = winapi.user32.GET_Y_LPARAM(lparam)
		return 0
	elseif msg == winapi.user32.WM.LBUTTONDOWN then
		-- Left click updates immediately
		return 0
	elseif msg == winapi.user32.WM.RBUTTONDOWN then
		-- Right click to hide/show cursor
		winapi.user32.showCursor(false)
		return 0
	elseif msg == winapi.user32.WM.RBUTTONUP then
		winapi.user32.showCursor(true)
		return 0
	end

	return winapi.user32.defWindowProc(hwnd, msg, wparam, lparam)
end

-- Register window class
local wndClass = winapi.user32.WndClassEx()
wndClass.lpszClassName = "InputDemoClass"
wndClass.lpfnWndProc = winapi.user32.WndProc(windowProc)
wndClass.hInstance = winapi.kernel32.getModuleHandle(nil)
wndClass.hCursor = winapi.user32.loadCursor(nil, winapi.user32.IDC.ARROW)
wndClass.hIcon = winapi.user32.loadIcon(nil, winapi.user32.IDI.APPLICATION)
wndClass.hbrBackground = winapi.user32.getSysColorBrush(winapi.user32.COLOR.WINDOW)
wndClass.style = winapi.user32.CS.HREDRAW + winapi.user32.CS.VREDRAW

if winapi.user32.registerClass(wndClass) == 0 then
	print("Failed to register window class: " .. winapi.kernel32.getLastErrorMessage())
	os.exit(1)
end

-- Create window
local hwnd = winapi.user32.createWindow(
	0,
	wndClass.lpszClassName,
	"Input Demo - Move mouse, press keys, click! ESC to exit",
	winapi.user32.WS.OVERLAPPEDWINDOW,
	winapi.user32.CW_USEDEFAULT,
	winapi.user32.CW_USEDEFAULT,
	800,
	600,
	nil,
	nil,
	wndClass.hInstance,
	nil
)

if hwnd == nil then
	print("Failed to create window: " .. winapi.kernel32.getLastErrorMessage())
	os.exit(1)
end

winapi.user32.showWindow(hwnd, winapi.user32.ShowWindow.SHOWNORMAL)
winapi.user32.updateWindow(hwnd)

print("Window created! Controls:")
print("  - Move mouse around")
print("  - Press WASD keys")
print("  - Left click to show click position")
print("  - Hold right mouse to hide cursor")
print("  - Press ESC to exit")

-- Main loop
local msg = winapi.user32.Msg()
local frameCount = 0

while running do
	-- Process all pending messages
	while winapi.user32.peekMessage(msg, nil, 0, 0, winapi.user32.PM.REMOVE) do
		winapi.user32.translateMessage(msg)
		winapi.user32.dispatchMessage(msg)
	end

	-- Update window title with current mouse position and pressed keys
	frameCount = frameCount + 1
	if frameCount % 5 == 0 then
		local title = string.format("Mouse: (%d, %d)", mouseX, mouseY)

		-- Show which WASD keys are pressed
		local keys = {}
		if keysPressed[winapi.user32.VK.W] then table.insert(keys, "W") end
		if keysPressed[winapi.user32.VK.A] then table.insert(keys, "A") end
		if keysPressed[winapi.user32.VK.S] then table.insert(keys, "S") end
		if keysPressed[winapi.user32.VK.D] then table.insert(keys, "D") end

		if #keys > 0 then
			title = title .. " | Keys: " .. table.concat(keys, "+")
		end

		-- Check async key state for SHIFT
		if winapi.user32.getAsyncKeyState(winapi.user32.VK.SHIFT) < 0 then
			title = title .. " | [SHIFT]"
		end

		winapi.user32.setWindowText(hwnd, title)
	end

	-- Small sleep to avoid hogging CPU
	winapi.kernel32.sleep(16) -- ~60fps
end

print("Window closed!")
