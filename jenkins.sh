#!/bin/bash

curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
#rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum upgrade -y
#yum install fontconfig java-21-openjdk -y
dnf install -y fontconfig java-17-amazon-corretto
yum install jenkins -y
systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins

#readlink -f /usr/bin/java
#/etc/sysconfig/jenkins
#JAVA_HOME=""