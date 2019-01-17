#!/bin/bash

mv /etc/yum.repos.d/CentOS7.repo /etc/yum.repos.d/CentOS7.repo.bak >/dev/null 2>&1
mv /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo.bak >/dev/null 2>&1

cat <<EOF > /etc/yum.repos.d/CentOS-Base.repo
[base]
name=CentOS-\$releasever - Base
baseurl=http://mirrors.sh.ctriptravel.com/centos-latest/\$releasever/os/\$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#released updates
[updates]
name=CentOS-\$releasever - Updates
baseurl=http://mirrors.sh.ctriptravel.com/centos-latest/\$releasever/updates/\$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#additional packages that may be useful
[extras]
name=CentOS-\$releasever - Extras
baseurl=http://mirrors.sh.ctriptravel.com/centos-latest/\$releasever/extras/\$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
EOF

cat <<EOF > /etc/yum.repos.d/epel-latest.repo
[epel-latest]
name=Latest Extra Packages for Enterprise Linux \$releasever - \$basearch
baseurl=http://mirrors.sh.ctriptravel.com/epel-latest/\$releasever/\$basearch
enabled=1
gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL
EOF

cat <<EOF > /etc/yum.repos.d/docker-ce.repo
[docker-ce]
name=Docker CE
baseurl=http://mirrors.sh.ctriptravel.com/cloudrepo/docker-ce/
enabled=1
gpgcheck=0
EOF

yum install docker-ce -y


mkdir -p /etc/docker
cat <<EOF > /etc/docker/daemon.json
{
  "bip": "10.0.108.1/23",
  "insecure-registries": [
    "mirror-hub.cloud.ctripcorp.com",
    "hub.cloud.ctripcorp.com",
    "10.9.196.194"
  ],
  "registry-mirror": "http://mirror-hub.cloud.ctripcorp.com"
}
EOF

usermod -aG docker imt
systemctl restart docker
chmod 666 /var/run/docker.sock
