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

You may encounter one or many of these problems listed here while compiling latest source code of ffmpeg. Here's how I solved them:

### Problem 1
After running the script I got this:
 
```bash
arm-linux-androideabi-gcc is unable to create an executable file.
C compiler test failed.
```

If you think configure made a mistake, make sure you are using the latest version from Git. 
 
One solution is to alter the configure file so that it doesn't give this problem. Edit ffmpeg-4.0.2/configure file and find this line and comment it:
```bash
die "C compiler test failed."
```

Another solution to that is to install gcc-arm-linux-androideabi by typing:

```bash
sudo apt install gcc-arm-linux-androideabi -y
```
 
 
### Problem 2
After rerunning the script I got this:

```bash
libavcodec/aaccoder.c: In function 'search_for_ms':
libavcodec/aaccoder.c:803:25: error: expected identifier or '(' before numeric constant
libavcodec/aaccoder.c:865:28: error: lvalue required as left operand of assignment
libavcodec/aaccoder.c:866:25: error: 'B1' undeclared (first use in this function)
libavcodec/aaccoder.c:866:25: note: each undeclared identifier is reported only once for each function it appears in
ffbuild/common.mak:60: recipe for target 'libavcodec/aaccoder.o' failed
make: *** [libavcodec/aaccoder.o] Error 1
```

I don't know how to solve it "properly", so I just did very simple fix. I replaced every occurance of B0 by b0 in aaccoder.c and then built it. It helped.
 
### Problem 3
But that's not all. Same problem causes this error:
 
```bash
libavcodec/hevc_mvs.c: In function 'derive_spatial_merge_candidates':
libavcodec/hevc_mvs.c:368:23: error: 'y0000000' undeclared (first use in this function)
libavcodec/hevc_mvs.c:368:23: note: each undeclared identifier is reported only once for each function it appears in
libavcodec/hevc_mvs.c:368:23: error: 'x0000000' undeclared (first use in this function)
libavcodec/hevc_mvs.c: In function 'ff_hevc_luma_mv_mvp_mode':
libavcodec/hevc_mvs.c:683:24: error: 'y0000000' undeclared (first use in this function)
libavcodec/hevc_mvs.c:683:24: error: 'x0000000' undeclared (first use in this function)
ffbuild/common.mak:60: recipe for target 'libavcodec/hevc_mvs.o' failed
```
 
Solution here is the same. Just replace B0 by b0 in hevc_mvs.c and type make.
 
### Problem 4
Same story here:
 
```bash
libavcodec/opus_pvq.c: In function 'quant_band_template':
libavcodec/opus_pvq.c:499:9: error: expected identifier or '(' before numeric constant
libavcodec/opus_pvq.c:560:12: error: lvalue required as left operand of assignment
ffbuild/common.mak:60: recipe for target 'libavcodec/opus_pvq.o' failed
make: *** [libavcodec/opus_pvq.o] Error 1
```
 
Replace B0 by b0 in opus_pvq.c and type make.
 
### Problem 5
stdio.h not found!!!
 
```bash
doc/print_options.c:26:19: fatal error: stdio.h: No such file or directory
compilation terminated.
ffbuild/common.mak:152: recipe for target 'doc/print_options.o' failed
make: *** [doc/print_options.o] Error 1
```

It seems that I have forgot about build essentials for Linux. To install this type:

```bash
sudo apt-get install build-essential -y
```
Otherwise you may want to check your imports, try checking in platforms folder and then your specific android API folder. Have you included it in the build command?


## References
  - [Prebuilt FFmpeg Android Scripts](https://github.com/Khang-NT/ffmpeg-binary-android)


## FFmpeg license
This software uses code of <a href="http://ffmpeg.org">FFmpeg</a> licensed under the <a href="http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html">LGPLv2.1</a> and its source can be downloaded from the <a href="http://ffmpeg.org">FFmpeg</a> website.

