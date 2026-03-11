local ffi = require("ffi")

---@param gdi winapi.gdi
return function(gdi)
	---@class winapi.gdi.Enums
	local enums = {}

	---@enum winapi.gdi.PFD_FLAGS
	enums.PFD_FLAGS = {
		DRAW_TO_WINDOW = 0x00000004,
		DRAW_TO_BITMAP = 0x00000008,
		SUPPORT_GDI = 0x00000010,
		SUPPORT_OPENGL = 0x00000020,
		GENERIC_ACCELERATED = 0x00001000,
		GENERIC_FORMAT = 0x00000040,
		NEED_PALETTE = 0x00000080,
		NEED_SYSTEM_PALETTE = 0x00000100,
		DOUBLEBUFFER = 0x00000001,
		STEREO = 0x00000002,
		SWAP_LAYER_BUFFERS = 0x00000800,
	}

	---@enum winapi.gdi.PFD_PIXEL_TYPE
	enums.PFD_PIXEL_TYPE = {
		RGBA = 0,
		COLORINDEX = 1,
	}

	---@enum winapi.gdi.PFD_LAYER_TYPE
	enums.PFD_LAYER_TYPE = {
		MAIN_PLANE = 0,
		OVERLAY_PLANE = 1,
		UNDERLAY_PLANE = -1,
	}

	-- Convenient combined flags
	enums.PFD_DRAW_TO_WINDOW = 0x00000004
	enums.PFD_SUPPORT_OPENGL = 0x00000020
	enums.PFD_TYPE_RGBA = 0
	enums.PFD_MAIN_PLANE = 0

	return enums
end
