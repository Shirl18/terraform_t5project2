#Data to be pulled
data "aws_ami" "linux2" {
    most_recent = true

    filter {
        name = "name"
        values = ["amzn-ami-hvm*"]
    }
}
