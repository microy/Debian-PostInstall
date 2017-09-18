# OpenCV

## Préparation

	# Base dependencies
	apt install build-essential cmake pkg-config git python-dev python-numpy python3-dev python3-numpy qtbase5-dev libv4l-dev 

	# Optional dependencies
	apt install libavcodec-dev libavformat-dev libswscale-dev libavresample-dev libtbb-dev libjpeg-dev libpng-dev libtiff5-dev libdc1394-22-dev libeigen3-dev libgl1-mesa-dev libglu1-mesa-dev libgoogle-glog-dev libgphoto2-dev liblapack-dev libleptonica-dev libopenexr-dev libprotobuf-dev libraw1394-dev libtesseract-dev ocl-icd-opencl-dev protobuf-compiler zlib1g-dev

## Compilation

	cd opencv
	mkdir build
	cd build

	cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF WITH_TBB=ON -D WITH_V4L=ON -D WITH_QT=ON -D WITH_OPENGL=ON ..

	make -j4

## Installation

	make install


## Test

 105  apt install cmake pkg-config git python-dev python-numpy python3-dev python3-numpy qtbase5-dev libv4l-dev libavcodec-dev libavformat-dev libswscale-dev libavresample-dev libtbb-dev libjpeg-dev libpng-dev libtiff5-dev libjasper-dev libdc1394-22-dev libeigen3-dev libgdal-dev libgl1-mesa-dev libglu1-mesa-dev libgoogle-glog-dev libgphoto2-dev liblapack-dev libleptonica-dev libopenexr-dev libprotobuf-dev libraw1394-dev libtesseract-dev libvtk6-dev ocl-icd-opencl-dev protobuf-compiler zlib1g-dev
  106  apt install cmake pkg-config git python-dev python-numpy python3-dev python3-numpy qtbase5-dev libv4l-dev libavcodec-dev libavformat-dev libswscale-dev libavresample-dev libtbb-dev libjpeg-dev libpng-dev libtiff5-dev libdc1394-22-dev libeigen3-dev libgdal-dev libgl1-mesa-dev libglu1-mesa-dev libgoogle-glog-dev libgphoto2-dev liblapack-dev libleptonica-dev libopenexr-dev libprotobuf-dev libraw1394-dev libtesseract-dev libvtk6-dev ocl-icd-opencl-dev protobuf-compiler zlib1g-dev
  107  apt install cmake pkg-config git python-dev python-numpy python3-dev python3-numpy qtbase5-dev libv4l-dev libavcodec-dev libavformat-dev libswscale-dev libavresample-dev libtbb-dev libjpeg-dev libpng-dev libtiff5-dev libdc1394-22-dev libeigen3-dev libgdal-dev libgl1-mesa-dev libglu1-mesa-dev libgoogle-glog-dev libgphoto2-dev liblapack-dev libleptonica-dev libopenexr-dev libprotobuf-dev libraw1394-dev libtesseract-dev ocl-icd-opencl-dev protobuf-compiler zlib1g-dev
  108  apt install libeigen3-dev
  109  apt install libgdal-dev
  110  apt install libgl1-mesa-dev libglu1-mesa-dev
  111  apt install libgoogle-glog-dev libgphoto2-dev
  112  apt install liblapack-dev
  113  apt install libleptonica-dev
  114  apt install libopenexr-dev
  115  apt install libprotobuf-dev
  116  apt install libraw1394-dev
  117  apt install libtesseract-dev
  118  apt install protobuf-compiler
  119  apt install zlib1g-dev
  120  apt install ocl-icd-opencl-dev

