--!strict

local process = require("@lune/process")
local pathfs = require("../../submodules/pathfs")
local Shell = require("../win32/Shell")
local dirsSys = {}

function dirsSys.homeDir(): pathfs.Path?
	local home = process.env.HOME
	if home then
		return pathfs.Path.from(home)
	end
	return
end

--[=[
	knownFolder will try:

	1. use shell32.dll by powershell to get known folder
	2. use powershell [System.Environment]::GetFolderPath to get known folder
	3. use reg.exe to get known folder
	4. just directly get environment variable path (not recommended btw)
]=]
function dirsSys.knownFolder(guid: string): pathfs.Path?
	local success, value = pcall(function()
		local script = `$GetSignature = @'\
[DllImport("shell32.dll", CharSet = CharSet.Unicode)]public extern static int SHGetKnownFolderPath(\
ref Guid folderId,\
uint flags,\
IntPtr token,\
out IntPtr pszProfilePath);\
'@\
$GetType = Add-Type -MemberDefinition $GetSignature -Name 'GetKnownFolders' -Namespace 'SHGetKnownFolderPath' -Using "System.Text" -PassThru -ErrorAction SilentlyContinue\
$ptr = [intptr]::Zero\
[void]$GetType::SHGetKnownFolderPath([Ref]"{guid}", 0, 0, [ref]$ptr)\
[System.Runtime.InteropServices.Marshal]::PtrToStringUni($ptr)\
[System.Runtime.InteropServices.Marshal]::FreeCoTaskMem($ptr)`
		local result = process.spawn("powershell", { "-Command", script })
		if result.ok then
			return result.stdout:split("\r\n")[1]
		else
			error("Powershell command was not successful")
		end
	end)
	if success then
		local path = pathfs.Path.from(value)
		return path
	end
	return
end

function dirsSys.knownFolderProfile(): pathfs.Path?
	return dirsSys.knownFolder(Shell.FOLDERID_Profile)
end

return dirsSys
