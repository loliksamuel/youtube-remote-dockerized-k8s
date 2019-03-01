youtube-remote
---------------------

The following repo was designed to demonstrate docker and kubernetes functionality. 
Starting from few docker files ... into minikube ... and scaling into a "full-blown" cluster, 


create app image using docker build
------------------
- cd ynginx     && docker build -t img-utube-nginx:2018 .
- cd ../yremote && docker build -t img-utube-remote:2018 . && cd ..

deploy app.
------------
choose 1 of the 2 options
 - 1. docker-compose up --build
 - 2. kubernetes - (k8s) 
 
2.1 create the cluster : using 
```sh
minikube start 
or 
kops create cluster --name=useast1.k8s.appychip.vpc --cloud=aws --zones=us-east-1d --dns-zone=appychip.vpc --dns private
```
2.2 validate the cluster exists   : 
```sh
kubectl config current-context 
or 
kubectl cluster-info
or 
kubectl get nodes
```
note:
 you can deploy Docker on multiple machines and manage them altogether as a single pool of resources. 
 There are several solutions that you can use to orchestrate your containers on multiple machines using docker.
You can use either :
#### Docker Swarm
#### Kubernetes
#### Mesos/Marathon
#### Fleet. (there might be others as this is a fast-moving area). 
#### Amazon ECS.

2.3 deploy using kubernetes or helm.sh
```sh
kubectl delete deployments --all &&  kubectl delete pods   --all &&  kubectl delete services --all
to convert docker-compose.yml to kubernetes, u can use : 
kompose convert
cd kube
kubectl apply -f mongo-service.yaml,ynginx-service.yaml,yremote-service.yaml,mongo-deployment.yaml,ynginx-deployment.yaml,yremote-deployment.yaml
or
kubectl create -f all.yaml
if u need ... kubectl delete service yremoteservice
kubectl get deployments,services,pods
minikube dashboard
http://192.168.99.100:30000/#!/overview?namespace=default
```
2.4 stop the cluster: using 
```sh
minikube stop 
or 
kops delete cluster --name=useast1.k8s.appychip.vpc --yes
```


play with app.
----------
- index.html
- http://localhost:80/
- http://localhost:81/
- http://localhost:3000/
- http://localhost:27017/

 
