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
 - 1. docker-compose up -d
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

2.3 deply using kebernetes or helm.sh
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

 