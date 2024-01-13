#! /bin/sh

PICO_SDK_PATH="~/dev/tool/iot/raspberry-pi/pico-template/pico-sdk"
PICO_TOOLCHAIN_PATH="~/dev/tool/iot/stm32/stm32-base/tools"
PARENT_DIR=$(pwd)

# ============= picotool =====================
echo "Compile picotool ......................"

cd picotool
mkdir -p build
cd build

cmake ..
make -j4

cd $PARENT_DIR

# ============= openocd =====================
echo "Compile openocd ......................"

export PATH="/usr/local/opt/texinfo/bin:$PATH"

cd openocd

./bootstrap
./configure --disable-werror
make -j4
# confirm it starts, it will error out as a probe isn't connected
src/openocd

cd $PARENT_DIR

# ============= picoprobe =====================
echo "Compile picoprobe ......................"

cd picoprobe
git submodule update --init

mkdir -p build
cd build

cmake ..
make -j4

cd $PARENT_DIR