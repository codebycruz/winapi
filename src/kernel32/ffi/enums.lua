---@class winapi.kernel32.Enums
local enums = {}

---@enum winapi.kernel32.FormatMessage
enums.FormatMessage = {
	FROM_SYSTEM = 0x00001000,
	IGNORE_INSERTS = 0x00000200,
	FROM_HMODULE = 0x00000800,
	FROM_STRING = 0x00000400,
	ALLOCATE_BUFFER = 0x00000100,
	ARGUMENT_ARRAY = 0x00002000,
}

return enums
