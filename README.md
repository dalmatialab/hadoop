![example workflow](https://github.com/dalmatialab/hadoop/actions/workflows/main.yml/badge.svg) 


# Supported tags and respective Dockerfile links

 - [3.3.0-rc-1](https://github.com/dalmatialab/hadoop/blob/786b798a4eb7578669f00682a6b7db6257a576b1/Dockerfile)
 - [3.3.0-rc-2](https://github.com/dalmatialab/hadoop/blob/9c8c8986642ec1c4b6853a24ea2864d01127d7ce/Dockerfile)

# What is Hadoop ? 

The [Apache™ Hadoop®](https://hadoop.apache.org/) project develops open-source software for reliable, scalable, distributed computing. The Apache Hadoop software library is a framework that allows for the distributed processing of large data sets across clusters of computers using simple programming models. It is designed to scale up from single servers to thousands of machines, each offering local computation and storage. Rather than rely on hardware to deliver high-availability, the library itself is designed to detect and handle failures at the application layer, so delivering a highly-available service on top of a cluster of computers, each of which may be prone to failures.

<img src="https://github.com/dalmatialab/hadoop/blob/6538eb1e6e25a8aecf7accdaa0c5fc2584d88b87/logo.png?raw=true" width="350" height="120">

# How to use this image

## Start Hadoop namenode instance

    $ docker run -d --name some-namenode -e TYPE=name -e CLUSTER_NAME=hdfs -p 9870:9870 image:tag

Where:

 - `some-namenode` is name you want to assign to your container
 - `image` is Docker image name
 - `tag` is Docker image version

## Start Hadoop datanode instance

    $ docker run -d --name some-datanode -e TYPE=data -e CORE_CONF_fs_defaultFS=hdfs://some-namenode:8020 image:tag

Where:

 - `some-datanode` is name you want to assign to your container
 - `some-namenode` is Hadoop namenode endpoint at which datanode is connecting
 - `image` is Docker image name
 - `tag` is Docker image version

## Environment variables

**TYPE**

This is *required* variable. It specifies starting script target. Possible values are: name, data.

**CLUSTER_NAME**

This is *required* variable. It specifies Hadoop cluster name.

**CORE_CONF_fs_defaultFS**

This is *required* variable. It specifies Hadoop namenode endpoint at which datanode will connect.

**TZ**

This is *optional* variable. It specifes timezone. Default value is `Europe/Zagreb`.

## Ports

Hadoop namenode exposes user interface at port 9870.

## Volumes

To save namenode data mount container path `/hadoop/dfs/name` to host path.  

    $ -v some-host-path:/hadoop/dfs/name  

To save datanode data mount container path `/hadoop/dfs/data` to host path.
    
    $ -v some-host-path:/hadoop/dfs/data

## NOTE


# License

