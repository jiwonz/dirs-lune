local dirsSys = require("dirs_sys")
local types = require("types")

local win: types.Sys = {
	homeDir = function() return dirsSys.knownFolderProfile() end
}

return win
