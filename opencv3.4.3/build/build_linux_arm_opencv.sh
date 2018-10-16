#!/bin/sh

set -e

#test -z $OPCV_SOURCE_PATH && OPCV_SOURCE_PATH=/home/five/opencv_ARM/opencv-3.4.3
WD=$(readlink -f "`dirname $0`/.")
OUTPUT=$WD/build
INSTALL=$OUTPUT/install

rm -rf $OUTPUT
mkdir -p $OUTPUT
mkdir -p $INSTALL
cd ${OUTPUT}

cmake -DCMAKE_INSTALL_PREFIX="${INSTALL}" \
	  -DCMAKE_SYSTEM_NAME="Linux" \
	  -DCMAKE_SYSTEM_PROCESSOR="arm" \
	  -DCMAKE_C_COMPILER="/home/five/projects/LinuxFB_tools/toolchain/gcc-linaro-7.1.1-2017.08-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc" \
	  -DCMAKE_CXX_COMPILER="/home/five/projects/LinuxFB_tools/toolchain/gcc-linaro-7.1.1-2017.08-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++" \
	  -DBUILD_opencv_apps=ON \
	  -DBUILD_opencv_calib3d=ON \
	  -DBUILD_opencv_core=ON \
	  -DBUILD_opencv_dnn=OFF \
	  -DBUILD_opencv_features2d=OFF \
	  -DBUILD_opencv_flann=OFF \
	  -DBUILD_opencv_highgui=ON \
	  -DBUILD_opencv_imgcodecs=ON \
	  -DBUILD_opencv_imgproc=ON \
	  -DBUILD_opencv_java_bindings_gen=ON \
	  -DBUILD_opencv_js=OFF \
	  -DBUILD_opencv_ml=OFF \
	  -DBUILD_opencv_objdetect=OFF \
	  -DBUILD_opencv_photo=ON \
	  -DBUILD_opencv_python_bindings_g=ON \
	  -DBUILD_opencv_shape=ON \
	  -DBUILD_opencv_stitching=OFF \
	  -DBUILD_opencv_superres=ON \
	  -DBUILD_opencv_ts=OFF \
	  -DBUILD_opencv_video=ON \
	  -DBUILD_opencv_videoio=ON \
	  -DBUILD_opencv_videostab=ON \
	  -DBUILD_opencv_world=OFF \
      ..

cmake --build . --config Release
make install/strip


