local Shell = require("Shell")

local KNOWNFOLDERIDS = {}
local SpecialFolder = {}

SpecialFolder.KNOWNFOLDERIDS = KNOWNFOLDERIDS

SpecialFolder.UserProfile = 4
SpecialFolder.ApplicationData = 26
SpecialFolder.LocalApplicationData = 28
SpecialFolder.MyMusic = 13
SpecialFolder.Desktop = 0
SpecialFolder.MyDocuments = 5
-- [SpecialFolder.Downloads] 'Downloads' is not a SpecialFolder in windows while it is KnownFolder
SpecialFolder.MyPictures = 39
-- [SpecialFolder.Public]
SpecialFolder.Templates = 21
SpecialFolder.MyVideos = 14

KNOWNFOLDERIDS[SpecialFolder.UserProfile] = Shell.FOLDERID_Profile
KNOWNFOLDERIDS[SpecialFolder.ApplicationData] = Shell.FOLDERID_RoamingAppData
KNOWNFOLDERIDS[SpecialFolder.LocalApplicationData] = Shell.FOLDERID_LocalAppData
KNOWNFOLDERIDS[SpecialFolder.MyMusic] = Shell.FOLDERID_Music
KNOWNFOLDERIDS[SpecialFolder.Desktop] = Shell.FOLDERID_Desktop
KNOWNFOLDERIDS[SpecialFolder.MyDocuments] = Shell.FOLDERID_Documents
KNOWNFOLDERIDS[SpecialFolder.MyPictures] = Shell.FOLDERID_Pictures
KNOWNFOLDERIDS[SpecialFolder.Templates] = Shell.FOLDERID_Templates
KNOWNFOLDERIDS[SpecialFolder.MyVideos] = Shell.FOLDERID_Videos

return SpecialFolder
