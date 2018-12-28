[FFmpeg Android Compiler](https://github.com/ervikaspec/ffmpeg_android_compiler/)
==============

## About
[FFmpeg Android Compiler](https://github.com/ervikaspec/ffmpeg_android_compiler/) is a complete project that simplifies your task of building ffmpeg using latest ffmpeg source code.

NDK r15c is used in this compiler helper as newer versions of NDK were causing problems with C++ formats in ffmpeg source code.

## Supported Architecture
* armv7
* armv7-a
* arm-v7n
* arm64-v8a
* i686 (or x86)
* x86_64 (64 bit)



## Build  

Prerequisites:
  * Android NDK r15c
  * `export NDK=path/to/android-ndk`

* NDK supplied here is darwin. You can replace it with linux or WIN but version needs to be r15c *

Build:
  * Download Android NDK r15c darwin from https://dl.google.com/android/repository/android-ndk-r15c-darwin-x86_64.zip. Unzip android-ndk-r15c-darwin-x86_64.zip
  * Untar ffmpeg-4.0.2.tar.bz2
  * Execute this

```bash
./start_build.sh
```

  * start_build.sh has a command to make binaries, full command is this:

```bash
export NDK=$(pwd)/android-ndk-r15c

FLAVOR=full       # or "lite"
TARGET=armv7-a    # Support targets: "arm", "armv7-a", "arm-v7n", "arm64-v8a", "i686", "x86_64"
BUILD_DIR=$(pwd)/build_dir
FINAL_DIR=$(pwd)/final/$TARGET
FFMPEG_VERSION=4.0.2

./build_ffmpeg.sh $TARGET $FLAVOR $BUILD_DIR $FINAL_DIR $FFMPEG_VERSION
```

The `ffmpeg` binary should in folder `$FINAL_DIR/$TARGET/$FLAVOR/ffmpeg` after build succeed.


## Help


## References
  - [Prebuilt FFmpeg Android Scripts](https://github.com/Khang-NT/ffmpeg-binary-android)


## FFmpeg license
This software uses code of <a href="http://ffmpeg.org">FFmpeg</a> licensed under the <a href="http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html">LGPLv2.1</a> and its source can be downloaded from the <a href="http://ffmpeg.org">FFmpeg</a> website.

