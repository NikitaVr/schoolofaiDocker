# soaDockerTensorflow

## Troubleshooting

### Docker says no space left on device :

https://stackoverflow.com/questions/30604846/docker-error-no-space-left-on-device

Cleanup : `docker volume rm $(docker volume ls -qf dangling=true)`

Get rid of \<none\> images : `docker rmi $(docker images | grep '^<none>' | awk '{print $3}')`
