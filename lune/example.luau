local dirs = require("../src/lib")

local temp = dirs.createTempFile()

print(temp.path)

temp:removeFile()
