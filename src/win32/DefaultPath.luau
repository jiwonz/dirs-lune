local Shell = require("Shell")

local DefaultPath = {}

DefaultPath[Shell.FOLDERID_Desktop] = "%USERPROFILE%\\Desktop"
DefaultPath[Shell.FOLDERID_Documents] = "%USERPROFILE%\\Documents"
DefaultPath[Shell.FOLDERID_Downloads] = "%USERPROFILE%\\Downloads"
DefaultPath[Shell.FOLDERID_LocalAppData] = { "%LOCALAPPDATA%", "%USERPROFILE%\\AppData\\Local" }
DefaultPath[Shell.FOLDERID_Music] = "%USERPROFILE%\\Music"
DefaultPath[Shell.FOLDERID_Pictures] = "%USERPROFILE%\\Pictures"
DefaultPath[Shell.FOLDERID_Profile] = { "%USERPROFILE%", "%SystemDrive%\\Users\\%USERNAME%" }
DefaultPath[Shell.FOLDERID_Public] = { "%PUBLIC%", "%SystemDrive%\\Users\\Public" }
DefaultPath[Shell.FOLDERID_RoamingAppData] = { "%APPDATA%", "%USERPROFILE%\\AppData\\Roaming" }
DefaultPath[Shell.FOLDERID_Templates] = "%APPDATA%\\Microsoft\\Windows\\Templates"
DefaultPath[Shell.FOLDERID_Videos] = "%USERPROFILE%\\Videos"

return DefaultPath
