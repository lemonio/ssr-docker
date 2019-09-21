yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum clean all
yum makecache
yum -y install docker-ce
systemctl start docker
systemctl enable docker

docker pull letssudormrf/ssr-bbr-docker
docker run --privileged --restart=always -d -p 8006:8006/tcp -p 8006:8006/udp --name ssr-bbr-docker letssudormrf/ssr-bbr-docker -p 8006 -k password -m aes-256-cfb -O auth_sha1_v4 -o plain

