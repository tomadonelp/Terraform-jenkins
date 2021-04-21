provider "aws" {
    region = "us-west-1"
  alias = "pubEnv"
}

provider "aws" {
    region = "us-west-2"
    alias = "pvtEnv"
}