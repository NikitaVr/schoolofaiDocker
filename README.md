# soaDockerTensorflow

`docker run --rm -p 10000:8888 -e JUPYTER_ENABLE_LAB=yes -v "$PWD":./mount jupyter/tensorflow-notebook`

## Troubleshooting

### Docker says no space left on device :

https://stackoverflow.com/questions/30604846/docker-error-no-space-left-on-device

Cleanup : `docker volume rm $(docker volume ls -qf dangling=true)`

Get rid of \<none\> images : `docker rmi $(docker images | grep '^<none>' | awk '{print $3}')`

run the command again `docker run --rm -p 10000:8888 -e JUPYTER_ENABLE_LAB=yes -v "$PWD":./mount jupyter/tensorflow-notebook`
