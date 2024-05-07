
#!/bin/bash
#Choosing users option
echo "select type of Deployment
VM
Docker"
read deployment

echo "select the list of application
demo-frontend
demo-backend1
demo-backend2"
read application

if [ "$deployment" == "VM"]; then

case $application in

        "demo-frontend")
                ssh ubuntu@172.31.93.224 "sudo git clone https://github.com/TekspotEdu/microserviceapp.git" 
                cd microserviceapp/demo-frontend
                ssh ubuntu@172.31.93.224 "sudo apt-get update && sudo apt-get install -y nginx"
                ssh ubuntu@172.31.93.224 "sudo service nginx start"
                ssh ubuntu@172.31.93.224 "sudo chown -R ubuntu /var/www/html"
                scp microserviceapp/demo-frontend/build/index.html ubuntu@172.31.93.224:/var/www/html/
;;
       "demo-backend1")
                ssh ubuntu@172.31.93.224 "sudo git clone https://github.com/TekspotEdu/microserviceapp.git" 
                cd microserviceapp/demo-backend1
                ssh ubuntu@172.31.93.224 "sudo apt-get update && sudo apt-get install -y openjdk-11-jdk"
                ssh ubuntu@172.31.93.224 "cd microserviceapp/demo-backend1/target/ && sudo java -jar sentiment-analysis-web-0.0.2-SNAPSHOT.jar --sa.logic.api.url http://$ip:5000"
;;
       "demo-backend2")
                 ssh ubuntu@172.31.93.224 "sudo git clone https://github.com/TekspotEdu/microserviceapp.git" 
                 cd microserviceapp/demo-backend2
                 ssh ubuntu@172.31.93.224 "sudo apt-get update && sudo apt-get install -y python3"
                 ssh ubuntu@172.31.93.224 "sudo apt-get update && sudo apt-get install -y python3-pip"
                 ssh ubuntu@172.31.93.224 "cd microserviceapp/demo-backend2/sa/ && sudo pip3 install -r requirements.txt 
                 ssh ubuntu@172.31.93.224 "sudo python3 sentiment_analysis.py"
;;
esac

else

# Install Docker
git clone https://github.com/TekspotEdu/microserviceapp.git

case $application in
           
      "demo-frontend")
              cd microserviceapp/demo-frontend  
              sudo apt-get update && sudo apt-get install -y npm && npm install && npm run build
              sudo docker push kavyakodavalla/demo-frontend:1.0.0
              sudo docker build -t kavyakodavalla/demo-frontend:1.0.0 . -f Docker.file
              sudo docker run -d -p 80:80 kavyakodavalla/demo-frontend:1.0.0
;;
      "demo-backend1")
               cd microserviceapp/demo-backend1 
               sudo apt-get update && sudo apt-get install -y maven && install maven
               sudo docker push kavyakodavalla/demo-backend1:latest
               sudo docker build -t kavyakodavalla/demo-backend1:latest . -f Docker.file
               sudo docker run -d -p 8080:8080 kavyakodavalla/demo-backend1:latest
;;
      "demo-backend2")
               cd microserviceapp/demo-backend2 
               sudo apt-get update && sudo apt-get install -y python3
               sudo apt-get update && sudo apt-get install -y python3-pip
               docker push kavyakodavalla/demo-backend2:latest
               sudo docker build -t kavyakodavalla/demo-backend2:latest . -f Docker.file
               sudo docker run -d kavyakodavalla/demo-backend2:latest
;;
fi
esac
