# Project: High Availability app deployment

## Project Introduction
You will deploy the high availability application. There will be two parts to this project:

Your company is creating an Instagram clone called Udagram.

Developers want to deploy a new application to the AWS infrastructure.

You have been tasked with provisioning the required infrastructure and deploying a dummy application, along with the necessary supporting software.

This needs to be automated so that the infrastructure can be discarded as soon as the testing team finishes their tests and gathers their results.

## Pre-conditions

### Preparations:
There will be two parts to this project:

Diagram: You'll first develop a diagram that you can present as part of your portfolio and as a visual aid to understand the CloudFormation script.

Script (Template and Parameters): The second part is to interpret the instructions and create a matching CloudFormation script.

### Server specifications
You'll need to create a Launch Configuration for your application servers in order to deploy four servers, two located in each of your private subnets. The launch configuration will be used by an auto-scaling group.

You'll need two vCPUs and at least 4GB of RAM. The Operating System to be used is Ubuntu 18. So, choose an Instance size and Machine Image (AMI) that best fits this spec.

Be sure to allocate at least 10GB of disk space so that you don't run into issues.

### Security Groups and Roles

Since you will be downloading the application archive from an S3 Bucket, you'll need to create an IAM Role that allows your instances to use the S3 Service.

Udagram communicates on the default HTTP Port: 80, so your servers will need this inbound port open since you will use it with the Load Balancer and the Load Balancer Health Check. As for outbound, the servers will need unrestricted internet access to be able to download and update their software.

The load balancer should allow all public traffic (0.0.0.0/0) on port 80 inbound, which is the default HTTP port. Outbound, it will only be using port 80 to reach the internal servers.

The application needs to be deployed into private subnets with a Load Balancer located in a public subnet.

One of the output exports of the CloudFormation script should be the public URL of the LoadBalancer. Bonus points if you add http:// in front of the load balancer DNS Name in the output, for convenience.

### Project structure
configurations: the directory running the deployment of network stacks and instance stacks, including:
1. network.yaml: The yaml script to deploy the network infrastructure
2. instance.yaml: The yaml script to deploy the ec2 instances, buckets
3. create-network-stacks.sh: The execution file to deploy the network stack from network.yaml
4. create-instance-stacks.sh: The execution file to deploy the instance stack from instance.yaml
5. update-network-stacks.sh: The execution file to update the network stack from network.yaml
6. update-instance-stacks.sh: The execution file to update the instace stack from instance.yaml
7. delete-network-stacks.sh: The execution file to delete the network stack
8. delete-instance-stacks.sh: The execution file to delete the instance stack
9. parameters folder: including the network parameter in network.json and instance parameter in instances.json

documentation: the directory of aws diagram

### How to run
#### Create stacks:
step 1: go to configurations folder
step 2: run create-network-stacks.sh to create the network stack
step 3: run create-instance-stacks.sh after the network stack is created successfully (<font color="red"><strong>do not run this file first when we want to create stack, some resources are refer to network stacks resources</strong></font>)
step 4: access to the Application Load Balancer URL from the input (name of the output is TestingUrl)
#### Update stacks:
step 1: go to configurations folder
step 2: run update-instance-stacks.sh, if you want to update the instance stack and if you want to update the network stack in case the instance stack has already created, then delete the instance stack first before running update-instance-stacks.sh
#### Delete stacks:
step 1: go to configurations folder
step 2: run delete-instance-stacks.sh first and then delete-network-stacks.sh
### Testing URL
It takes some time to let all targets in target group become healthy
The ALB Url is in the screenshots folder, access to the link of TestingUrl