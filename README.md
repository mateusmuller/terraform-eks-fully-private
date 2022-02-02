# Terraform Fully-Private EKS Cluster

This is just a simple project that I've created to practice for the Terraform Associate certification.

## EKS Fully-Private Cluster

A EKS Fully-Private Cluster does not make use of **NAT Gateway** neither **Internet Gateway**. There are no routes to external world at all.

This means that, on our Terraform code, we need:

* VPC Endpoints to reach AWS APIs like sts, ec2, ecr...
* Deploy the AWS VPC CNI, so the new nodes can reach the Control Plane

You can read more about this **[here](https://eksctl.io/usage/eks-private-cluster/)**.

## How to use it?

In case you'd like to try, there is an example folder **[here](/example)**.

* `modules.tf`: This is where we call each module separately and pass the parameters. You probably won't need to change it.
* `provider.tf`: Setup the AWS provider and remote backend (if needed).
* `variables.tf`: The variables to pass.
* `variables.tfvars`: Example of variables to pass.

So the commands are:

```
$ terraform init
$ terraform apply -var-file variables.tfvars
```

You can also pass the variables `desired_size, max_size and min_size` to the `node_group` module.