# CMake toolchain: arm-linux-gnueabihf (runs on arm64 host, targets armv7l Linux)
# Used as fallback when the x86_64 webOS NDK can't execute on this arm64 host.
# The kit builds SDL/FFmpeg/libass from source for the target — no sysroot needed
# for those; only the system libc (glibc) differs from webOS (musl), but the app
# binary itself runs fine as the TV's webOS userland provides all required .so files.

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR armv7l)

set(CMAKE_C_COMPILER   arm-linux-gnueabihf-gcc)
set(CMAKE_CXX_COMPILER arm-linux-gnueabihf-g++)
set(CMAKE_STRIP        arm-linux-gnueabihf-strip)
set(CMAKE_AR           arm-linux-gnueabihf-ar)
set(CMAKE_RANLIB       arm-linux-gnueabihf-ranlib)

set(CMAKE_C_FLAGS_INIT   "-march=armv7-a -mfpu=neon -mfloat-abi=hard")
set(CMAKE_CXX_FLAGS_INIT "-march=armv7-a -mfpu=neon -mfloat-abi=hard")

# No sysroot — kit builds its own deps; link against them, not host libs.
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
