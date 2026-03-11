local ffi = require("ffi")

ffi.cdef([[#embed "gdi/ffi/ffidefs.h"]])

---@class gdi.PIXELFORMATDESCRIPTOR: ffi.cdata*
---@field nSize number
---@field nVersion number
---@field dwFlags number
---@field iPixelType number
---@field cColorBits number
---@field cRedBits number
---@field cRedShift number
---@field cGreenBits number
---@field cGreenShift number
---@field cBlueBits number
---@field cBlueShift number
---@field cAlphaBits number
---@field cAlphaShift number
---@field cAccumBits number
---@field cAccumRedBits number
---@field cAccumGreenBits number
---@field cAccumBlueBits number
---@field cAccumAlphaBits number
---@field cDepthBits number
---@field cStencilBits number
---@field cAuxBuffers number
---@field iLayerType number

local C = ffi.load("gdi32")

return {
	---@type fun(hdc: user32.HDC, ppfd: gdi.PIXELFORMATDESCRIPTOR): integer
	choosePixelFormat = C.ChoosePixelFormat,

	---@type fun(hdc: user32.HDC, iPixelFormat: integer, ppfd: gdi.PIXELFORMATDESCRIPTOR): boolean
	setPixelFormat = C.SetPixelFormat,

	---@type fun(hdc: user32.HDC)
	swapBuffers = C.SwapBuffers,

	PFD_DRAW_TO_WINDOW = 0x00000004,
	PFD_SUPPORT_OPENGL = 0x00000020,
	PFD_TYPE_RGBA = 0,
	PFD_MAIN_PLANE = 0,

	---@type fun(): gdi.PIXELFORMATDESCRIPTOR
	newPFD = function()
		---@diagnostic disable-next-line: missing-return-value # ffi.new isn't typed properly for some reason
		return ffi.new("PIXELFORMATDESCRIPTOR", {
			nSize = ffi.sizeof("PIXELFORMATDESCRIPTOR"),
			nVersion = 1,
			dwFlags = 0x00000004 + 0x00000020,
			iPixelType = 0,
			cColorBits = 32,
			cDepthBits = 24,
			cStencilBits = 8,
			iLayerType = 0,
		})
	end,
}
