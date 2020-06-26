#!/bin/sh

docker rm /pcdet

docker run -it \
        --gpus=all \
        --net=host \
        --privileged=true \
        --ipc=host \
        --volume="/tmp/.X11-unix:/tmp/.X11-unix:ro" \
        --env="DISPLAY" \
        --env="QT_X11_NO_MITSHM=1" \
	--hostname="inside-DOCKER" \
	--name="pcdet" \
        -v $(pwd):/pcdet \
        -v /data/dataset/kitti:/data/dataset/kitti \
	pcdet-docker bash
