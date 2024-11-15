provider "aws" {
  region = var.region #"eu-central-1"
}


module "iam_users"{
    source = "./modules/iam"
    user_names = var.user_list #["user1", "user2", "user3"]
}



