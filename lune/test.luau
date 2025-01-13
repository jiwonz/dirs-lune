local dirs = require("../src")
local pathfs = require("../lune_packages/pathfs")

local temp = dirs.createTempDir()

print(temp)

pathfs.removeDir(temp)
