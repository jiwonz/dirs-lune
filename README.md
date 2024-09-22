# dirs-lune
A library for lune that provides config/cache/data paths. heavily inspired (almost port) by [dirs-rs](https://github.com/dirs-dev/dirs-rs)

## Limitations
Since lune cannot do low-level operations and does not have ffi functionality, `dirs-lune` has the following limitations:
- Lacks `getpwuid_r` checking (on linux)
- Paths of Windows known folders are returned via `Powershell` (on windows)
