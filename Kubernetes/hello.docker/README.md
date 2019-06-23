# Istio

Commands

````bash
kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=$(gcloud config get-value core/account)

kubectl label namespace default istio-injection=enabled

kubectl -n istio-system get service istio-ingressgateway
````
