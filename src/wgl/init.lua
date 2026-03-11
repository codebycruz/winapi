local ffi = require("ffi")

ffi.cdef([[#embed "wgl/ffi/ffidefs.h"]])

local C = ffi.load("opengl32")

---@class wgl.HGLRC: userdata

return {
	---@type fun(name: string): fun(...): any
	getProcAddress = C.wglGetProcAddress,

	---@type fun(hdc: user32.HDC): wgl.HGLRC
	createContext = C.wglCreateContext,

	---@type fun(hdc: user32.HDC, hglrc: wgl.HGLRC): number
	makeCurrent = C.wglMakeCurrent,

	---@type fun(hglrc: wgl.HGLRC): boolean
	deleteContext = C.wglDeleteContext,
}
