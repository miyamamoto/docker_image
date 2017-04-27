FROM nvidia/cuda:7.5-devel

MAINTAINER Chip Garner <chip@garnertotalenergy.com>

RUN mkdir OpenCV && cd OpenCV

RUN apt-get update && apt-get install -y \
  build-essential \
  checkinstall \
  cmake \
  pkg-config \
  yasm \
  libtiff5-dev \
  libjpeg-dev \
  libjasper-dev \
  libavcodec-dev \
  libavformat-dev \
  libswscale-dev \
  libdc1394-22-dev \
  libxine-dev \
  libgstreamer0.10-dev \
  libgstreamer-plugins-base0.10-dev \
  libv4l-dev \
  python-dev \
  python-numpy \
  python-pip \
  libtbb-dev \
  libeigen3-dev \
  libqt4-dev \
  libgtk2.0-dev \
  # Doesn't work libfaac-dev \
  libmp3lame-dev \
  libopencore-amrnb-dev \
  libopencore-amrwb-dev \
  libtheora-dev \
  libvorbis-dev \
  libxvidcore-dev \
  x264 \ 
  v4l-utils \
 # Doesn't work ffmpeg \
  libgtk2.0-dev \
#  zlib1g-dev \
#  libavcodec-dev \
  unzip \
  wget
  

RUN cd /opt && \
  wget https://github.com/Itseez/opencv/archive/3.1.0.zip -O opencv-3.1.0.zip -nv && \
  unzip opencv-3.1.0.zip && \
  cd opencv-3.1.0 && \
  rm -rf build && \
  mkdir build && \
  cd build && \
  cmake -D CUDA_ARCH_BIN=3.2 \
    -D CUDA_ARCH_PTX=3.2 \
    -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D WITH_TBB=ON \
    -D BUILD_NEW_PYTHON_SUPPORT=ON \
    -D WITH_V4L=ON \
    -D BUILD_TIFF=ON \
 #   -D USE_GStreamer=ON \
     -D WITH_CUBLAS=1 \
     -D CUDA_FAST_MATH=1\
    -D WITH_OPENGL=ON .. && \
  make -j8 && \
  make install && \
  echo "/usr/local/lib" | sudo tee -a /etc/ld.so.conf.d/opencv.conf && \
  ldconfig
RUN cp /opt/opencv-3.1.0/build/lib/cv2.so /usr/lib/python2.7/dist-packages/cv2.so

# Install MKL
RUN cd /tmp && \
# Download MKL install package
  wget -q http://registrationcenter-download.intel.com/akdlm/irc_nas/8374/l_mkl_11.3.1.150.tgz && \
# Install MKL
  tar -xzf l_mkl_11.3.1.150.tgz && cd l_mkl_11.3.1.150 && \
  sed -i 's/ACCEPT_EULA=decline/ACCEPT_EULA=accept/g' silent.cfg && \
  sed -i 's/ACTIVATION_TYPE=exist_lic/ACTIVATION_TYPE=trial_lic/g' silent.cfg && \
  ./install.sh -s silent.cfg && \
   cd .. && rm -rf *

RUN wget https://github.com/TadasBaltrusaitis/OpenFace/archive/master.zip 
RUN unzip master.zip &&\
cd OpenFace-master&&\
mkdir build&&\
cd build&&\
cmake -D CMAKE_BUILD_TYPE=RELEASE ..&&\
make

