local ffi = require("ffi")

ffi.cdef([[#embed "kernel32/ffi/ffidefs.h"]])

---@class kernel32.HMODULE: ffi.cdata*

local C = ffi.load("kernel32")

return {
	---@type fun(lpModuleName: string?): kernel32.HMODULE
	getModuleHandle = C.GetModuleHandleA,

	---@type fun(): number
	getLastError = C.GetLastError,

	---@type fun(): string
	getLastErrorMessage = function()
		local FORMAT_MESSAGE_FROM_SYSTEM = 0x00001000
		local buffer = ffi.new("char[256]")

		local msgLen = C.FormatMessageA(FORMAT_MESSAGE_FROM_SYSTEM, nil, C.GetLastError(), 0, buffer, ffi.sizeof(buffer),
			nil)
		if msgLen == 0 then
			return "Unknown error"
		end

		return ffi.string(buffer, msgLen)
	end,
}
