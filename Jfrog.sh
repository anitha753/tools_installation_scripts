
###########################    100% working - without Docker     ##########################333
Install JFrog on Ubuntu 24.04 LTS
sudo apt update
sudo apt install openjdk-8-jdk -y
sudo wget https://jfrog.bintray.com/artifactory/jfrog-artifactory-oss-6.9.6.zip
sudo apt install unzip -y
sudo unzip -o jfrog-artifactory-oss-6.9.6.zip -d /opt/
cd /opt/artifactory-oss-6.9.6
./bin/artifactory.sh start
http://<your-server-ip>:8081 
OR goto SSH Client--> Connect to your instance using its Public DNS:
ec2-54-197-31-101.compute-1.amazonaws.com:8081

------------------------------------------------------------------------------------------------------------------
###########################   100% working  -   Jfrog With Docker     ##########################333
Install JFrog on Ubuntu 24.04 LTS,  T2.medium 30 GB
sudo su
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt install openjdk-17-jre -y 
Install docker 
docker -v 
apt update -y
sudo usermod -aG docker $USER
docker pull releases-docker.jfrog.io/jfrog/artifactory-oss:7.55.10
sudo mkdir -p /jfrog/artifactory
sudo chown -R 1030 /jfrog/
docker images
               REPOSITORY                                                       TAG         IMAGE ID            CREATED         SIZE
               releases-docker.jfrog.io/jfrog/artifactory-oss    7.55.10    835f7b69f418      2 years ago     1.51GB
docker run --name artifactory -v /jfrog/artifactory:/var/opt/jfrog/artifactory -d -p 8081:8081 -p 8082:8082 releases-docker.jfrog.io/jfrog/artifactory-oss:7.55.10
docker ps -a

In Browser  http://<your-server-ip>:8081 
successfully we can get jfrog user interface  http://54.89.153.210:8081/artifactory/    changes to http://54.147.211.184:8082/ui/ then goes to login page http://54.147.211.184:8082/ui/login/

navigate to the "Repositories" section, click "Add Repository," and select "Local". Choose the desired package type (e.g., Maven, ) and configure the repository settings, including the unique key( as your wish, like "example-repo-local"),Environment (DEV),release/snapshot type, . Finally, click "Create Local Repository". 
then go to Applicaton --> Artfactory --> Artifacts here automatically your repo will appear --> clock on the repo -->copy URL to file http://54.147.211.184:8082/artifactory/example-repo-local/ 

Goto Target folder in instance where jar file is present there only we copy & paste this following command

curl -X PUT -u admin:currentpassword -T kubernetes-configmap-reload-0.0.1-SNAPSHOT.jar http://54.147.211.184:8082/artifactory/example-repo-local/

successfully we can deploy the JAR file to jfrog 
 Applicaton --> Artfactory --> Artifacts here automatically your repo will appear
            
