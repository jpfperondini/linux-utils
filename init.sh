#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

cd ~

#Directories
mkdir ~/projects
mkdir ~/tools

#PPA Repositories
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo add-apt-repository ppa:webupd8team/brackets
sudo add-apt-repository ppa:webupd8team/java

#Update
sudo apt-get update

#PPA Programs
sudo apt-get install git oracle-java8-installer vim google-chrome-stable brackets curl hub

#Config
git config --global user.name "João Pedro Perondini"
git config --global user.email jpfperondini@gmail.com

#Intellij
mkdir -p ~/tools/intellij/14/
cd ~/tools/intellij/14/
wget https://download.jetbrains.com/idea/ideaIC-14.1.4.tar.gz
tar xfz ideaIC-14.1.4.tar.gz
mv idea-IC-141.1532.4/* .
rm ideaIC-14.1.4.tar.gz
rm -r idea-IC-141.1532.4
#TODO add intellij to path?
cd ~

#maven
cd ~/tools
wget http://ftp.unicamp.br/pub/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz
tar xfz apache-maven-3.3.3-bin.tar.gz
mv apache-maven-3.3.3 maven
rm apache-maven-3.3.3-bin.tar.gz
cd ~

#docker
#Disable this line if you are behind a proxy.
#curl -sSL https://get.docker.com/gpg | sudo apt-key add -
curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker $(whoami)

#docker compose
sudo -i
curl -L https://github.com/docker/compose/releases/download/1.4.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
exit
