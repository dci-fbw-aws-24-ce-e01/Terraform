terraform{
    backend "s3" {
        bucket = "terraform-remote-sharanya"
        key = "remote-state-files/terraform.tfstate"
        region = "eu-central-1"      
    }
}