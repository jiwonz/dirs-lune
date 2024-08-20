local process = require("@lune/process")
local types = require("types")
local sys: types.Sys

if process.os == "windows" then
	sys = require("win")
end

local dirs = {}

function dirs.homeDir()
	return sys.homeDir()
end

return dirs
