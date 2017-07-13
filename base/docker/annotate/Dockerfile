FROM continuumio/anaconda3
RUN echo "Installing Essential dependencies..."
RUN apt-get -y update
RUN apt-get -y install build-essential
RUN apt-get -y install llvm
RUN apt-get -y install clang libc++-dev libc++abi-dev
RUN apt-get -y install cmake
RUN apt-get -y install git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
RUN apt-get -y install libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev checkinstall cpio axel
RUN apt-get -y install  build-essential
RUN conda install -y -c menpo ffmpeg=3.1.3
RUN conda install -y -c menpo opencv
RUN conda install -y cmake
RUN conda install -y gcc
RUN conda install -y boost
RUN pip install pyannote-video
RUN cd /opt && git clone https://github.com/pyannote/pyannote-data.git
RUN cd /opt && git clone https://github.com/davisking/dlib-models.git
RUN cd /opt && bunzip2 dlib-models/dlib_face_recognition_resnet_model_v1.dat.bz2
RUN cd /opt && bunzip2 dlib-models/shape_predictor_68_face_landmarks.dat.bz2
RUN cd /opt && git clone https://github.com/pyannote/pyannote-video.git
#RUN pip install -i https://pypi.anaconda.org/pypi/simple moviepy
RUN pip install moviepy --upgrade

