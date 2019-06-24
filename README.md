# docker-choreonoid
This is a docker image with choreonoid version 1.7.
Chreonoid is build with openrtm plugin.
Openrtm's version is 1.1.2 in this image since choreonoid still has some problem with ver 1.2.0.
Also install ros-kinetic-hrpsys and gtest for further use.

# pull from docker hub
docker pull hsnuhayato/choreonoid1.7

# run image
you can run the image with the script below
```bash
#!/bin/bash

xhost +si:localuser:root
docker run  -it --name choreonoid_sandbox --rm   \
       -v $(pwd):/mnt --workdir=/mnt \
       --net host \
       --privileged     \
       --env="DISPLAY"  \
       --env="QT_X11_NO_MITSHM=1" \
       --env="LANG=ja_JP.UTF-8" \
       hsnuhayato/choreonoid1.7 /bin/bash
```

# try example
run this commands below to start name server and choreonoid
```bash
# rtm-naming
# choreonoid
```
Then choose project file from choreonoid GUI:
File->open object-> choose /usr/local/share/choreonoid-1.7/project/OpenRTM-SR1Walk.cnoid.

Then press the green buttom(Start simulation from the beginning).The sample robot will start to walk.
