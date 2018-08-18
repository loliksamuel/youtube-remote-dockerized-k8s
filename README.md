docker-youtube-remote
Repository for Docker 101 workshop + kubernetes
------------------
#cd ynginx
#docker build -t localhost:5000/utube/ynginx:2018 .

#cd ../yremote
#docker build -t localhost:5000/utube/yremote:2018 .

#cd ..
#docker-compose up -d

run
----------
#index.html
#http://localhost:80/
#http://localhost:81/
#http://localhost:3000/
#http://localhost:27017/

kubernetes
---------
#install minikube
#minikube start
#kubectl create -f yremote-deployment+service.yaml
#kubectl get deployments, services, pods
#minikube dashboard
#minikube stop
