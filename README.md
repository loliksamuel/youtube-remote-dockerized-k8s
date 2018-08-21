youtube-remote
---------------------

The following repo was designed to demonstrate docker and kubernetes functionality. 
Starting from few docker files ... into minikube ... and scaling into a "full-blown" cluster, 


docker
------------------
- cd ynginx
- docker build -t localhost:5000/utube/ynginx:2018 .
- cd ../yremote
- docker build -t localhost:5000/utube/yremote:2018 .
- cd ..
- docker-compose up -d

run
----------
- index.html
- http://localhost:80/
- http://localhost:81/
- http://localhost:3000/
- http://localhost:27017/

kubernetes
---------
- install minikube
- minikube --memory=4096 start
- kubectl create -f yremote-deployment-service.yaml
- if u need ... kubectl delete service yremoteservice
- kubectl get deployments,services,pods
- minikube dashboard
- http://192.168.99.100:30000/#!/overview?namespace=default
- minikube stop
