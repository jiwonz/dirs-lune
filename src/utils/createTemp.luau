-- Implementation based on https://github.com/Stebalien/tempfile/blob/6e995724c10bc9c5f524df2575c8f3fe1a7df875/src/util.rs

local pathfs = require("../../lune_packages/pathfs")
local tempDir = require("./tempDir")

local NUM_RETRIES = bit32.lshift(1, 31)
local NUM_RAND_CHARS = 6
local CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

local function randomAlphanumeric(length: number): string
	local res = {}
	for i = 1, length do
		local choice = math.random(1, #CHARS)
		res[i] = CHARS:sub(choice, choice)
	end
	return table.concat(res)
end

local function tmpname(prefix: string, suffix: string, randomLength: number): string
    local buf = table.create(3)
	table.insert(buf, prefix)
    table.insert(buf, randomAlphanumeric(randomLength))
	table.insert(buf, suffix)
	return table.concat(buf)
end

return function(isDir: boolean, base: pathfs.AsPath?, prefix: string?, suffix: string?, randomLength: number?): pathfs.Path
	local base = pathfs.Path.from(base or tempDir())
	local prefix = prefix or ".tmp"
	local suffix = suffix or ""
	local randomLength = randomLength or NUM_RAND_CHARS

	local numRetries = if randomLength ~= 0 then NUM_RETRIES else 1
	local checkTemp = (if isDir then pathfs.isDir else pathfs.isFile) :: typeof(pathfs.isDir)
	local writeTemp = (if isDir then pathfs.writeDir else pathfs.writeFile) :: typeof(pathfs.writeDir)

	for _ = 1, numRetries do
		local path = base:join(tmpname(prefix, suffix, randomLength))
		if checkTemp(path) and numRetries > 1 then
			continue
		else
			local success = pcall(writeTemp, path)
			if success then
				return path
			elseif numRetries > 1 then
				continue
			end
		end
	end

	error("too many temporary files exist")
end
