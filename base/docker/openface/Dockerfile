FROM continuumio/anaconda3
# Essential Dependencies
RUN echo "Installing Essential dependencies..."
RUN  apt-get -y update
RUN  apt-get -y install build-essential
RUN  apt-get -y install llvm
RUN  apt-get -y install clang libc++-dev libc++abi-dev
RUN  apt-get -y install cmake
# apt-get -y install libopenblas-dev liblapack-dev
RUN  apt-get -y install git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
RUN  apt-get -y install libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev checkinstall cpio axel
RUN echo "Essential dependencies installed."
RUN conda install -y libgcc
#RUN conda install -y -c menpo opencv3

RUN echo "Downloading OpenCV..."
RUN wget https://github.com/Itseez/opencv/archive/3.1.0.zip
RUN apt-get install -u unzip
RUN unzip 3.1.0.zip
RUN cd opencv-3.1.0 && mkdir -p build && cd build &&cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_SHARED_LIBS=OFF .. &&make -j4 && make install &&cd ../.. &&rm 3.1.0.zip && rm -r opencv-3.1.0

# Boost C++ Dependency
RUN echo "Installing Boost..."
RUN apt-get install -y libboost-all-dev

# Install MKL
RUN cd /tmp && \
  axel -a -n 3 http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/11306/l_mkl_2017.2.174.tgz 
RUN cd /tmp && \
  tar -xzf l_mkl_2017.2.174.tgz && \
  cd l_mkl_2017.2.174 && \
  sed -i 's/ACCEPT_EULA=decline/ACCEPT_EULA=accept/g' silent.cfg && \
  ./install.sh -s silent.cfg && \
  cd .. && \
  rm -rf *

# OpenFace installation
RUN echo "Installing OpenFace..."
RUN git clone https://github.com/TadasBaltrusaitis/OpenFace.git
RUN cd OpenFace && mkdir -p build && cd build && cmake -D CMAKE_BUILD_TYPE=RELEASE .. &&make -j8
RUN mv OpenFace /opt/

