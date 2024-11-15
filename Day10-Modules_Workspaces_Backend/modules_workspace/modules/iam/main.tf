


resource "aws_iam_user" "user" {
    for_each = {for each_name in var.user_names: each_name =>each_name }
    name = "sharanya-${terraform.workspace}-${each.value}"


}