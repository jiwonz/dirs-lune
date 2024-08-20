# Function GetKnownFolder([string]$KnownFolderCLSID) {
# 	$GetSignature = @'
#     [DllImport("shell32.dll", CharSet = CharSet.Unicode)]public extern static int SHGetKnownFolderPath(
#     ref Guid folderId,
#     uint flags,
#     IntPtr token,
#     out IntPtr pszProfilePath);
# '@
# 	$GetType = Add-Type -MemberDefinition $GetSignature -Name 'GetKnownFolders' -Namespace 'SHGetKnownFolderPath' -Using "System.Text" -PassThru -ErrorAction SilentlyContinue
# 	$ptr = [intptr]::Zero
# 	[void]$GetType::SHGetKnownFolderPath([Ref]"$KnownFolderCLSID", 0, 0, [ref]$ptr)
# 	$result = [System.Runtime.InteropServices.Marshal]::PtrToStringUni($ptr)
# 	[System.Runtime.InteropServices.Marshal]::FreeCoTaskMem($ptr)
# 	return $result
# }

# $GetSignature = @'
# [DllImport("shell32.dll", CharSet = CharSet.Unicode)]public extern static int SHGetKnownFolderPath(
# ref Guid folderId,
# uint flags,
# IntPtr token,
# out IntPtr pszProfilePath);
# '@
# $GetType = Add-Type -MemberDefinition $GetSignature -Name 'GetKnownFolders' -Namespace 'SHGetKnownFolderPath' -Using "System.Text" -PassThru -ErrorAction SilentlyContinue
# $ptr = [intptr]::Zero
# [void]$GetType::SHGetKnownFolderPath([Ref]"{FDD39AD0-238F-46AF-ADB4-6C85480369C7}", 0, 0, [ref]$ptr)
# [System.Runtime.InteropServices.Marshal]::PtrToStringUni($ptr)
# [System.Runtime.InteropServices.Marshal]::FreeCoTaskMem($ptr)

explorer "shell :::{559D40A3-A036-40FA-AF61-84CB430A4D34}"
