terraform {
    required_providers {
      aws= {
        source = "hashicorp/aws"
        version = "5.3.0"
      }

      linode={
        source = "linode/linode"
        version = "1.25.2"
      }
    }
}