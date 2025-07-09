Steps of implementation:

1. Deploy a VPC and a subnet.
2. Deploy an internet gatway and associate it with the VPC.
3. Setup a route table with a route to the IGW and associate it with the subnet.
4. Deploy an EC2 instance inside of the created subnet and associate it with a public IP.
5. Associate a public IP and a security group that allow public ingress.
6. Change the EC2 instance to use a publicaly available AMI.
7. Destroy everything.


#Steps to launch the project.

1. Ensure to link the aws account through the .env fil out of the working directory by "source .env" command. ****The source .env only works in linux.
2. Run "terraform init" cmd in the working directory to install the dependencies.
3. Run the  "terraform apply" cmd to execute the changes.
4. Congratulations!! All the resources are running on your AWS console.
5. You can delete everything in just one command by hitting cmd "terraform destroy -auto-approve". 