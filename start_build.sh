export NDK=$(pwd)/android-ndk-r15c

FLAVOR=full       # or "lite"
TARGET=armv7-a    # Support targets: "arm", "armv7-a", "arm-v7n", "arm64-v8a", "i686", "x86_64"
BUILD_DIR=$(pwd)/build_dir
FINAL_DIR=$(pwd)/final/$TARGET
FFMPEG_VERSION=4.0.2

./build_ffmpeg.sh $TARGET $FLAVOR $BUILD_DIR $FINAL_DIR $FFMPEG_VERSION