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
RUN  apt-get -y install libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev checkinstall
RUN echo "Essential dependencies installed."

RUN conda install -y -c menpo opencv3=3.1.0
# Boost C++ Dependency
RUN echo "Installing Boost..."
RUN apt-get install -y libboost-all-dev

# OpenFace installation
RUN echo "Installing OpenFace..."
RUN git clone https://github.com/TadasBaltrusaitis/OpenFace.git

# Install MKL
RUN apt-get install -y axel
RUN cd /tmp && \
  axel -a -n 3 http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/11306/l_mkl_2017.2.174.tgz 
RUN apt-get install -y cpio
RUN cd /tmp && \
  tar -xzf l_mkl_2017.2.174.tgz && \
  cd l_mkl_2017.2.174 && \
  sed -i 's/ACCEPT_EULA=decline/ACCEPT_EULA=accept/g' silent.cfg && \
  ./install.sh -s silent.cfg && \
  cd .. && \
  rm -rf *

RUN cd OpenFace && mkdir -p build && cd build && cmake -D CMAKE_BUILD_TYPE=RELEASE .. &&make -j8
RUN mv OpenFace /opt/

