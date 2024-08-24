eksctl cli is used for setting up the EKS cluster on AWS.

-->  To install, on windows, open "power shell" app in Administrator mode, then run this command: "choco install eksctl"

Once installed, for autocomplete, use the following commands: . <(eksctl completion bash)

-->  then using the aws configure command setup your AWS account credentials

-->  To create a cluster, use the following commands:

***** THIS will cost you MONEY , so please be careful while running this command **************
eksctl create cluster --name test-cluster --region us-east-1 --nodes 1 --node-type t3.medium

$ eksctl create cluster --name test-cluster --region us-east-1 --nodes 1 --node-type t3.medium
2024-08-24 15:21:38 [ℹ]  eksctl version 0.189.0
2024-08-24 15:21:38 [ℹ]  using region us-east-1
2024-08-24 15:21:40 [ℹ]  setting availability zones to [us-east-1b us-east-1d]
2024-08-24 15:21:40 [ℹ]  subnets for us-east-1b - public:192.168.0.0/19 private:192.168.64.0/19
2024-08-24 15:21:40 [ℹ]  subnets for us-east-1d - public:192.168.32.0/19 private:192.168.96.0/19
2024-08-24 15:21:40 [ℹ]  nodegroup "ng-daccee99" will use "" [AmazonLinux2/1.30]
2024-08-24 15:21:40 [ℹ]  using Kubernetes version 1.30
2024-08-24 15:21:40 [ℹ]  creating EKS cluster "test-cluster" in "us-east-1" region with managed nodes
2024-08-24 15:21:40 [ℹ]  will create 2 separate CloudFormation stacks for cluster itself and the initial managed nodegroup
2024-08-24 15:21:40 [ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=us-east-1 --cluster=test-cluster'
2024-08-24 15:21:40 [ℹ]  Kubernetes API endpoint access will use default of {publicAccess=true, privateAccess=false} for cluster "test-cluster" in "us-east-1"
2024-08-24 15:21:40 [ℹ]  CloudWatch logging will not be enabled for cluster "test-cluster" in "us-east-1"
2024-08-24 15:21:40 [ℹ]  you can enable it with 'eksctl utils update-cluster-logging --enable-types={SPECIFY-YOUR-LOG-TYPES-HERE (e.g. all)} --region=us-east-1 --cluster=test-cluster'
2024-08-24 15:21:40 [ℹ]  default addons kube-proxy, coredns, vpc-cni were not specified, will install them as EKS addons
2024-08-24 15:21:40 [ℹ]
2 sequential tasks: { create cluster control plane "test-cluster",
    2 sequential sub-tasks: {
        2 sequential sub-tasks: {
            1 task: { create addons },
            wait for control plane to become ready,
        },
        create managed nodegroup "ng-daccee99",
    }
}
2024-08-24 15:21:40 [ℹ]  building cluster stack "eksctl-test-cluster-cluster"
2024-08-24 15:21:42 [ℹ]  deploying stack "eksctl-test-cluster-cluster"
2024-08-24 15:22:12 [ℹ]  waiting for CloudFormation stack "eksctl-test-cluster-cluster"
2024-08-24 15:22:43 [ℹ]  waiting for CloudFormation stack "eksctl-test-cluster-cluster"
2024-08-24 15:23:44 [ℹ]  waiting for CloudFormation stack "eksctl-test-cluster-cluster"
2024-08-24 15:24:45 [ℹ]  waiting for CloudFormation stack "eksctl-test-cluster-cluster"

2024-08-24 15:29:59 [ℹ]  waiting for CloudFormation stack "eksctl-test-cluster-cluster"
2024-08-24 15:31:44 [ℹ]  waiting for CloudFormation stack "eksctl-test-cluster-cluster"
2024-08-24 15:32:45 [ℹ]  waiting for CloudFormation stack "eksctl-test-cluster-cluster"
2024-08-24 15:32:49 [ℹ]  creating addon
2024-08-24 15:32:50 [ℹ]  successfully created addon
2024-08-24 15:32:51 [ℹ]  creating addon
2024-08-24 15:32:51 [ℹ]  successfully created addon
2024-08-24 15:32:52 [!]  recommended policies were found for "vpc-cni" addon, but since OIDC is disabled on the cluster, eksctl cannot configure the requested permissions; the recommended way to provide IAM permissions for "vpc-cni" addon is via pod identity associations; after addon creation is completed, add all recommended policies to the config file, under `addon.PodIdentityAssociations`, and run `eksctl update addon`
2024-08-24 15:32:52 [ℹ]  creating addon
2024-08-24 15:32:53 [ℹ]  successfully created addon


2024-08-24 15:34:58 [ℹ]  building managed nodegroup stack "eksctl-test-cluster-nodegroup-ng-daccee99"
2024-08-24 15:34:59 [ℹ]  deploying stack "eksctl-test-cluster-nodegroup-ng-daccee99"
2024-08-24 15:35:00 [ℹ]  waiting for CloudFormation stack "eksctl-test-cluster-nodegroup-ng-daccee99"
2024-08-24 15:35:31 [ℹ]  waiting for CloudFormation stack "eksctl-test-cluster-nodegroup-ng-daccee99"
2024-08-24 15:36:11 [ℹ]  waiting for CloudFormation stack "eksctl-test-cluster-nodegroup-ng-daccee99"
2024-08-24 15:37:11 [ℹ]  waiting for CloudFormation stack "eksctl-test-cluster-nodegroup-ng-daccee99"
2024-08-24 15:38:17 [ℹ]  waiting for CloudFormation stack "eksctl-test-cluster-nodegroup-ng-daccee99"
2024-08-24 15:38:17 [ℹ]  waiting for the control plane to become ready
2024-08-24 15:38:19 [✔]  saved kubeconfig as "C:\\Users\\DELL\\.kube\\config"
2024-08-24 15:38:19 [ℹ]  no tasks
2024-08-24 15:38:19 [✔]  all EKS cluster resources for "test-cluster" have been created
2024-08-24 15:38:19 [✔]  created 0 nodegroup(s) in cluster "test-cluster"
2024-08-24 15:38:20 [ℹ]  nodegroup "ng-daccee99" has 1 node(s)
2024-08-24 15:38:20 [ℹ]  node "ip-192-168-62-232.ec2.internal" is ready
2024-08-24 15:38:20 [ℹ]  waiting for at least 1 node(s) to become ready in "ng-daccee99"
2024-08-24 15:38:20 [ℹ]  nodegroup "ng-daccee99" has 1 node(s)
2024-08-24 15:38:20 [ℹ]  node "ip-192-168-62-232.ec2.internal" is ready
2024-08-24 15:38:20 [✔]  created 1 managed nodegroup(s) in cluster "test-cluster"
2024-08-24 15:38:28 [ℹ]  kubectl command should work with "C:\\Users\\DELL\\.kube\\config", try 'kubectl get nodes'
2024-08-24 15:38:28 [✔]  EKS cluster "test-cluster" in "us-east-1" region is ready


![image](https://github.com/user-attachments/assets/22747edb-2fe0-4a20-a18c-3c50c2381846)

-->  To delete a cluster 

eksctl delete cluster --name my-cluster
