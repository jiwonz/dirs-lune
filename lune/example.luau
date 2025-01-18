local dirs = require("../src")
local pathfs = require("../lune_packages/pathfs")
local fs = pathfs.fs

local temp = dirs.createTempFile()

print(temp.path)

temp:removeFile()
