typedef void *HMODULE;
typedef const char *LPCSTR;
HMODULE GetModuleHandleA(LPCSTR lpModuleName);

unsigned long GetLastError(void);
unsigned long FormatMessageA(unsigned long dwFlags, const void *lpSource,
                             unsigned long dwMessageId,
                             unsigned long dwLanguageId, char *lpBuffer,
                             unsigned long nSize, void *Arguments);
