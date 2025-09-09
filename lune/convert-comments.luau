local fs = require("@lune/fs")

local result: { string } = {
	"--[=["
}

local input = fs.readFile("playground/input.rs"):split("\n")
for _, line in input do
	--local line = stdio.prompt("text")
	if line == "" then
		continue
	end
	local start = ""
	local pos = 1
	for i = 1, #line do
		local char = line:sub(i, i)
		if char == "/" then
			pos += 1
		elseif char == " " then
			pos += 1
			start = "\t"
		else
			break
		end
	end
	table.insert(result, start .. line:sub(pos))
end

table.insert(result, "]=]")

fs.writeFile("playground/comment.lua", table.concat(result, "\n"))
