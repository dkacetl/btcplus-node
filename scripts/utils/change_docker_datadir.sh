systemctl stop docker
rm -rf /var/lib/docker
ln -s /media/davedata /var/lib/docker
systemctl start docker

