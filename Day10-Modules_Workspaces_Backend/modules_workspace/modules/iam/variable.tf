variable "user_names" {
    description = "List of IAM user names"
    type = list(string) #["name1", "name2"]
    # type = list [1,2,3,"abcd", 123242, "asdbajd"]
}