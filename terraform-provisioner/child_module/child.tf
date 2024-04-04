# In child module (child.tf)

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# Add this output block
output "child_instance_type" {
  value = var.instance_type
}
