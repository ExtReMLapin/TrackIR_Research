local key = "\x0e\x9a\x63\x71\x05\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"
local keyHandle = require("rc4")(key)
--https://github.com/CheyiLin/lrc4
local fileHandle = io.open("sgl.dat", "rb")
local payload = fileHandle:read("*all")
fileHandle:close()
local decrypted = keyHandle(payload)
decrypted = decrypted:gsub("\r\n", "\n")

fileHandle = io.open("sgl.xml", "w")
fileHandle:write(decrypted)
fileHandle:close()
