local ffi = require("ffi")

ffi.cdef([[#embed "gdi/ffi/ffidefs.h"]])

---@class winapi.gdi.Fns
---@field ChoosePixelFormat fun(hdc: winapi.gdi.ffi.HDC, ppfd: winapi.gdi.ffi.PIXELFORMATDESCRIPTOR): number
---@field SetPixelFormat fun(hdc: winapi.gdi.ffi.HDC, iPixelFormat: number, ppfd: winapi.gdi.ffi.PIXELFORMATDESCRIPTOR): number
---@field SwapBuffers fun(hdc: winapi.gdi.ffi.HDC): nil
local C = ffi.load("gdi32")

---@class winapi.gdi: winapi.gdi.Enums
local gdi = {}

local enums = require("winapi.gdi.ffi.enums")(gdi)
for k, v in pairs(enums) do
	gdi[k] = v
end

gdi.choosePixelFormat = C.ChoosePixelFormat
gdi.swapBuffers = C.SwapBuffers

---@param hdc winapi.gdi.ffi.HDC
---@param iPixelFormat number
---@param ppfd winapi.gdi.ffi.PIXELFORMATDESCRIPTOR
---@return boolean
function gdi.setPixelFormat(hdc, iPixelFormat, ppfd)
	return C.SetPixelFormat(hdc, iPixelFormat, ppfd) ~= 0
end

---@type fun(): winapi.gdi.ffi.PIXELFORMATDESCRIPTOR
gdi.PixelFormatDescriptor = ffi.typeof("PIXELFORMATDESCRIPTOR") ---@diagnostic disable-line # ffi.typeof isn't typed properly

---@return winapi.gdi.ffi.PIXELFORMATDESCRIPTOR
function gdi.NewPFD()
	return ffi.new("PIXELFORMATDESCRIPTOR", {
		nSize = ffi.sizeof("PIXELFORMATDESCRIPTOR"),
		nVersion = 1,
		dwFlags = gdi.PFD_DRAW_TO_WINDOW + gdi.PFD_SUPPORT_OPENGL,
		iPixelType = gdi.PFD_TYPE_RGBA,
		cColorBits = 32,
		cDepthBits = 24,
		cStencilBits = 8,
		iLayerType = gdi.PFD_MAIN_PLANE,
	}) ---@diagnostic disable-line # ffi.new isn't typed properly
end

return gdi
