#!/bin/bash

docker run                              \
 --rm                                   \
 -it --gpus=all                         \
 --net host                             \
 -v $HOME/.Xauthority:/root/.Xauthority \ 
 --privileged
