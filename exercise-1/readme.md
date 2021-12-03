# Exercise 1

[Link to exercise](https://devops-bootcamp.liatr.io/#/6-automation-and-orchestration/6.3-terraform?id=exercise-1-getting-started)

The point of this exercise was to familirize yourself with the workings of Terraform. Some important notes include the following:

- The different steps of terraform:
	- `terraform init` - Prepare your working directory
	- `terraform validate` - Validate whether the configuration file is valid
	- `terraform plan` - Do a dry run of what terraform needs to do to reach desired state
	- `terraform apply` - Run the plan that that was talked about previously
	- `terraform destroy` - Cleanup all the resources that terraform created
- Using `aws-vault` in order to talk to the aws provider through terraform since we don't use IAM access users.
- Using `terraform show` to get information about a aws instance so we can ssh into it