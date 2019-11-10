FROM ros:kinetic

RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
    apt-key del 421C365BD9FF1F717815A3895523BAEEB01FA116 && \
    apt-get update && \
    apt-get install -y sudo software-properties-common && \
    add-apt-repository ppa:hrg/daily && \
    apt-get update && \
    apt-get install -y --force-yes \
        gcc g++ \
        make uuid-dev libboost-filesystem-dev \
        libomniorb4-dev omniidl \
        openrtm-aist openrtm-aist-doc \
        openrtm-aist-dev openrtm-aist-example \
        openrtm-aist-python ipython git \
        python-yaml && \
    apt-get clean && \
    echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc && \
    apt update && \
    apt install -y ros-kinetic-hrpsys && \
    apt install -y ros-kinetic-pcl-ros
    

RUN git clone https://github.com/s-nakaoka/choreonoid.git && \
    git clone https://github.com/google/googletest.git && \
    cd /choreonoid && \
    git checkout v1.7.0 && \
    echo "y" | ./misc/script/install-requisites-ubuntu-16.04.sh && \
    cmake . \
        -DCMAKE_BUILD_TYPE=Release       \
        -DINSTALL_SDK:BOOL=TRUE          \
        -DINSTALL_DEPENDENCIES:BOOL=TRUE \
        -DCNOID_ENABLE_GETTEXT:BOOL=TRUE \
        -DUSE_EXTERNAL_EIGEN:BOOL=TRUE   \
        -DUSE_EXTERNAL_YAML:BOOL=TRUE    \
        -DENABLE_CORBA:BOOL=TRUE         \
        -DBUILD_CORBA_PLUGIN:BOOL=TRUE   \
        -DBUILD_OPENRTM_PLUGIN:BOOL=TRUE \
        -DBUILD_OPENRTM_SAMPLES:BOOL=TRUE \
        -DBUILD_GROBOT_PLUGIN:BOOL=TRUE  \
        -DBUILD_ASSIMP_PLUGIN:BOOL=FALSE \
        -DBUILD_PYTHON_PLUGIN:BOOL=TRUE && \
    make && \
    make install && \
    cd ../googletest && \
    cmake . && \
    make && \
    make install
