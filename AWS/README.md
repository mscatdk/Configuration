# AWS

## Tools

```bash
# Install aws CLI tool
pip3 install awscli --upgrade
aws --version
aws configure

# Install aws-iam-authenticator
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.12.7/2019-03-27/bin/linux/amd64/aws-iam-authenticator
sudo mv aws-iam-authenticator /usr/local/bin
```

## EKS

```bash
# Update kubectl config
aws eks --region [Region] update-kubeconfig --name [Cluster name]

# Install eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

# Create cluster
eksctl create cluster --name=[cluster name] --nodes=2

# Hallo world deployment
kubectl create deployment hello-node --image=gcr.io/hello-minikube-zero-install/hello-node

# Create Hallo world service
kubectl expose deployment hello-node --type=LoadBalancer --port=8080
```

## Debug IAM settings

```bash
aws sts decode-authorization-message --encoded-message [AWS-error-code]
```




