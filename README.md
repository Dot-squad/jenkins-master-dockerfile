# Jenkins master Docker image

This image intend to provide a Jenkins instance with a Docker installation.

## Amazon Web Service - ECS
When deployed, this image could used its host Docker daemon.
For AWS ECS, you should mount the socket as a volume.
* /var/run/docker.sock:/var/run/docker.sock

The docker client will now send the commands to the host daemon though this socket.

### Permissions
Doing so, it could raise a permission denied error. The 'jenkins' user of the container must have write access to the socket. Per default, the socket is owned by root and the docker group.
The provided user data could be use in EC2 to give read-write access to the 'other' (chmod o+rw <docker.sock>)

It raises a security issue as jenkins could mount any file in a container and use it to modify it.
