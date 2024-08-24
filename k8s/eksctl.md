eksctl cli is used for setting up the EKS cluster on AWS.

-->  To install, on windows, open "power shell" app in Administrator mode, then run this command: "choco install eksctl"

Once installed, for autocomplete, use the following commands: . <(eksctl completion bash)

-->  then using the aws configure command setup your AWS account credentials

-->  To create a cluster, use the following commands:

***** THIS will cost you MONEY , so please be careful while running this command **************
eksctl create cluster --name test-cluster --region us-east-1 --nodes 1 --node-type t3.medium

-->  To delete a cluster 

eksctl delete cluster --name my-cluster
