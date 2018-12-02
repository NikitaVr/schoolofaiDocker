# Clone Repository

For Windows make sure to be inside a sub folder of `C:\Users` or else you will get permission errors

# Setup

## Setup Image

Do one of these :

### 1

to build locally:

`docker build -t jupyter_stacks_tensorflow . `

### 2

to download prebuilt image:

`docker pull nikitavr/jupyter_stacks_tensorflow`

Going forward use `nikitavr/jupyter_stacks_tensorflow` in the instructions instead of `jupyter_stacks_tensorflow`

### 3

to download prebuilt image without NLTK:

`docker pull nikitavr/jupyter_stacks_tensorflow_lite`

Going forward use `nikitavr/jupyter_stacks_tensorflow_lite` in the instructions instead of `jupyter_stacks_tensorflow`

## Run Image

~~`chown 1000 mount/` this sets docker as owner of mount folder so it can write to it when mounted inside container~~

`docker-machine ip` save this IP somewhere

`docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v "$PWD"/mount:/home/jovyan/work jupyter_stacks_tensorflow`

then go to `http://<machine ip>:8888/?token=<token>`

## Troubleshooting

### Port taken ( by previosly running container ) 

`docker container ls` look for ID of your already running process

`docker kill <id>`

### Docker says no space left on device :

https://stackoverflow.com/questions/30604846/docker-error-no-space-left-on-device

Cleanup : `docker volume rm $(docker volume ls -qf dangling=true)`

Get rid of \<none\> images : `docker rmi $(docker images | grep '^<none>' | awk '{print $3}')`

run the command again `docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v "$PWD"/mount:/home/jovyan/work jupyter_stacks_tensorflow`

### Mount Permissions

https://jupyter-docker-stacks.readthedocs.io/en/latest/using/common.html


```
-v /some/host/folder/for/work:/home/jovyan/work - Mounts a host machine directory as folder in the container.

Useful when you want to preserve notebooks and other work even after the container is destroyed.

You must grant the within-container notebook user or group (NB_UID or NB_GID) write access 

to the host directory (e.g., sudo chown 1000 /some/host/folder/for/work).
```
