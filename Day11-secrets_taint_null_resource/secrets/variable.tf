variable "username" {
  description= "Username for db"
  type = string
  sensitive = true
}

variable "password" {
  description= "password for db"
  type = string
  sensitive = true
#   default = "1234abcd"
}



# windows powershell:
# $Env:custom_variable = "custom_value"
# $Env:TF_VAR_username = "terraform_admin"
# $Env:TF_VAR_password = "terraform_admin12345"


# #list of env variables:
# Get-ChildItem Env:

#remove env variable:
# Remove-Item Env:TF_VAR_username



# windows cmd:
# set custom_variable = "custom_value"

# for ubuntu:
# export custom_variable = "custom_value"