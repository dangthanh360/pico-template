#! /bin/sh

PICO_SDK_PATH="~/dev/tool/iot/raspberry-pi/pico-template/pico-sdk"
PICO_TOOLCHAIN_PATH="~/dev/tool/iot/stm32/stm32-base/tools"
PARENT_DIR=$(pwd)

PICO_EXAMPLE_DIR=$PARENT_DIR/examples

# ============= pico-examples =====================
echo "Compile pico-examples ......................"

cd examples
mkdir -p build
cd build

cmake ..

cd blink
make -j4

cd $PICO_EXAMPLE_DIR
cd build
cd hello_world
make -j4

cd $PARENT_DIR