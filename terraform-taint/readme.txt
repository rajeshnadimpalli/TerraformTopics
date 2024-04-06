The EC2 instance will be created, but the user_data script will fail due to the
invalid package name. (ngnixxxx)

Now, correct the user_data script by replacing nginxxxx with nginx:
---------
terraform taint aws_instance.example
terraform apply
