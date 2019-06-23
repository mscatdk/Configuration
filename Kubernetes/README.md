# Kubernetes

## Dashboard

Deploy grafana, heapster, influxdb, and kubernetes-dashboard

````bash
curl -sSL https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/influxdb/grafana.yaml | sed "s/amd64/arm/g" | kubectl create -f -
curl -sSL https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/influxdb/heapster.yaml | sed "s/amd64/arm/g" | kubectl create -f -
curl -sSL https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/influxdb/influxdb.yaml | sed "s/amd64/arm/g" | kubectl create -f -
curl -sSL https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/rbac/heapster-rbac.yaml | sed "s/amd64/arm/g" | kubectl create -f -
curl -sSL https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended/kubernetes-dashboard.yaml | sed "s/amd64/arm/g" | kubectl create -f -
````

Create service account

````bash
kubectl create serviceaccount cluster-admin-dashboard-sa
kubectl create clusterrolebinding cluster-admin-dashboard-sa --clusterrole=cluster-admin --serviceaccount=default:cluster-admin-dashboard-sa

kubectl get secret | grep cluster-admin-dashboard-sa
kubectl describe secret [token name something like cluster-admin-dashboard-sa-token-xxxxx]
````

Connect

````bash
kubectl proxy

# go to
http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
````
