#!/bin/bash
# Installing JAVA && Jenkins 
sudo yum install java-1.8* -y
sudo yum install wget -y
sudo yum install git -y
sudo yum install epel-release java-11-openjdk-devel
sudo amazon-linux-extras install epel -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum install jenkins -y
sudo dnf upgrade
sudo dnf install chkconfig java-devel
sudo dnf install jenkins
# Start jenkins service
sudo systemctl start jenkins
# Setup Jenkins to start at boot
sudo systemctl enable jenkins
sudo yum install git -y
sudo yum install python
sudo yum install python-pip
pip3 install ansible
# Installing Docker 
yum install docker -y
service docker start
service docker status
sudo useradd dockeradmin
# sudo passwd dockeradmin TODO LIST
sudo usermod -aG docker dockeradmin
sudo chmod 666 /var/run/docker.sock
# install Sonarqube scanner
mkdir sonnar-canna
cd sonnar-canna
sudo unzip sonar-scanner-cli-4.6.2.2472-linux.zip
sudo mv sonar-scanner-4.6.2.2472-linux  sonar-scanner-cli
sudo mv sonar-scanner-cli /opt/sonar/
# cd into /opt/sonar/conf and add format("http://%s:%s", aws_instance.SonarQubesinstance.public_ip, var.sonar_port)
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472-linux.zip
# Installing maven
sudo su
mkdir /opt/maven
cd /opt/maven
wget https://dlcdn.apache.org/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz
tar -xvzf apache-maven-3.8.4-bin.tar.gz

# Install Gitlab
sudo curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh" | sudo bash
sudo yum install gitlab-runner -y
sudo yum list gitlab-runner --showduplicates | sort -r



