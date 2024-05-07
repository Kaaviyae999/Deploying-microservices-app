# Microservices-Application
This script describes Automating the Deployment of frontend, backend1 and backend2 applications

# First, the user can able to select the type of Deployment & application he wants by using the "echo" command.
echo "select type of Deployment
echo "select the list of application

# Now, we use the control structures "if & else" to select the type of deployment
if [ "$deployment" == "VM"]; 

# Later on, I use "case" statement that allows us to set the value of a variable.
case $application in
Now follow the step by step process to run the application in an AWS virtual machine.

else 

# Docker needs to be installed for running the application on container
# Deploy Docker.sh

# clone code from github
git clone https://github.com/TekspotEdu/microserviceapp.git

# Build the frontend, backend1 & backend2 application using npm, maven & python pip
 sudo apt-get update && sudo apt-get install -y npm && npm install && npm run build
 sudo apt-get update && sudo apt-get install -y maven && install maven
 sudo apt-get update && sudo apt-get install -y python3
 sudo apt-get update && sudo apt-get install -y python3-pip

 # push container image to Docker hub registry
 sudo docker push kavyakodavalla/demo-frontend:1.0.0
 sudo docker push kavyakodavalla/demo-backend1:latest
 docker push kavyakodavalla/demo-backend2:latest

# Run docker
sudo docker run -d -p 80:80 kavyakodavalla/demo-frontend:1.0.0
sudo docker run -d -p 8080:8080 kavyakodavalla/demo-backend1:latest
sudo docker run -d kavyakodavalla/demo-backend2:latest


