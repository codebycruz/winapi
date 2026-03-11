local ffi = require("ffi")

---@param user32 winapi.user32
return function(user32)
	---@class winapi.user32.Enums
	local enums = {}

	---@enum winapi.user32.IDC
	enums.IDC = {
		ARROW = user32.LPCSTR(32512),
		HAND = user32.LPCSTR(32649),
	}

	---@enum winapi.user32.IDI
	enums.IDI = {
		APPLICATION = user32.LPCSTR(32512),
	}

	---@enum winapi.user32.COLOR
	enums.COLOR = {
		WINDOW = 5,
	}

	---@enum winapi.user32.CS
	enums.CS = {
		HREDRAW = 0x0002,
		VREDRAW = 0x0001,
	}

	---@enum winapi.user32.WS
	enums.WS = {
		BORDER           = 0x00800000,
		CAPTION          = 0x00C00000,
		CHILD            = 0x40000000,
		CHILDWINDOW      = 0x40000000,
		CLIPCHILDREN     = 0x02000000,
		CLIPSIBLINGS     = 0x04000000,
		DISABLED         = 0x08000000,
		DLGFRAME         = 0x00400000,
		GROUP            = 0x00020000,
		HSCROLL          = 0x00100000,
		ICONIC           = 0x20000000,
		MAXIMIZE         = 0x01000000,
		MAXIMIZEBOX      = 0x00010000,
		MINIMIZE         = 0x20000000,
		MINIMIZEBOX      = 0x00020000,
		OVERLAPPED       = 0x00000000,
		OVERLAPPEDWINDOW = 0x00CF0000,
		POPUP            = 0x80000000,
		POPUPWINDOW      = 0x80880000,
		SIZEBOX          = 0x00040000,
		SYSMENU          = 0x00080000,
		TABSTOP          = 0x00010000,
		THICKFRAME       = 0x00040000,
		VISIBLE          = 0x10000000,
		VSCROLL          = 0x00200000,
	}

	---@enum winapi.user32.WM
	enums.WM = {
		CREATE            = 0x0001,
		DESTROY           = 0x0002,
		CLOSE             = 0x0010,
		QUIT              = 0x0012,
		PAINT             = 0x000F,
		SIZE              = 0x0005,
		SETCURSOR         = 0x0020,
		MOUSEMOVE         = 0x0200,
		LBUTTONDOWN       = 0x0201,
		LBUTTONUP         = 0x0202,
		RBUTTONDOWN       = 0x0204,
		RBUTTONUP         = 0x0205,
		KEYDOWN           = 0x0100,
		KEYUP             = 0x0101,
		CHAR              = 0x0102,
		SYSKEYDOWN        = 0x0104,
		SYSKEYUP          = 0x0105,
		SYSCHAR           = 0x0106,
		ERASEBKGND        = 0x0014,
		NCDESTROY         = 0x0082,
		ACTIVATE          = 0x0006,
		ACTIVATEAPP       = 0x001C,
		SETFOCUS          = 0x0007,
		KILLFOCUS         = 0x0008,
		GETMINMAXINFO     = 0x0024,
		COMMAND           = 0x0111,
		SYSCOMMAND        = 0x0112,
		TIMER             = 0x0113,
		CTLCOLORBTN       = 0x0135,
		CTLCOLOREDIT      = 0x0133,
		CTLCOLORLISTBOX   = 0x0134,
		CTLCOLORMSGBOX    = 0x0132,
		CTLCOLORSCROLLBAR = 0x0136,
		CTLCOLORSTATIC    = 0x0138,
	}

	---@enum winapi.user32.PM
	enums.PM = {
		REMOVE = 0x0001,
	}

	---@enum winapi.user32.ShowWindow
	enums.ShowWindow = {
		HIDE            = 0,
		SHOWNORMAL      = 1,
		SHOWMINIMIZED   = 2,
		SHOWMAXIMIZED   = 3,
		SHOWNOACTIVATE  = 4,
		SHOW            = 5,
		MINIMIZE        = 6,
		SHOWMINNOACTIVE = 7,
		SHOWNA          = 8,
		RESTORE         = 9,
		SHOWDEFAULT     = 10,
		FORCEMINIMIZE   = 11,
	}

	-- Create window default
	enums.CW_USEDEFAULT = 0x80000000
end
