---@class winapi.user32.ffi.HWND: ffi.cdata*

---@class winapi.user32.ffi.MSG: ffi.cdata*
---@field hwnd user32.HWND
---@field message number
---@field wParam number
---@field lParam number
---@field time number
---@field pt { x: number, y: number }
---@field lPrivate number

---@alias winapi.user32.ffi.WNDPROC fun(hWnd: user32.HWND, uMsg: number, wParam: number, lParam: number): number

---@class winapi.user32.ffi.WNDCLASSEXA: ffi.cdata*
---@field lpfnWndProc ffi.cdata*
---@field hInstance ffi.cdata*
---@field lpszClassName string
---@field hCursor ffi.cdata*
---@field hIcon ffi.cdata*
---@field hIconSm ffi.cdata*
---@field cbSize number
---@field hbrBackground ffi.cdata*
---@field style number

---@class winapi.user32.ffi.HDC: ffi.cdata*

---@class winapi.user32.ffi.RECT: ffi.cdata*
---@field left number
---@field top number
---@field right number
---@field bottom number

---@class winapi.user32.ffi.LPCSTR: ffi.cdata*
