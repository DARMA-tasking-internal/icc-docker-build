# Building a docker container with ICC

The license in the repository `COM____DDW8-CKHSP7GN.lic` is valid for a
year. After that, we will need to replace this license. The configuration file
is `silent.cfg`, which configures the intel installer to only install ICC (not
all the other packages) to minimize the size.

First, get docker. Then, to build from the repository directory:

```shell
docker build --file icc-18.03.dockerfile .
```

This will build the container. Then, using the hash provided for the container,
tag it appropriately.

```shell
docker tag <container-hash-id> lifflander1/icc:18.03
```
