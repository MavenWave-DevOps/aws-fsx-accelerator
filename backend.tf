terraform {
      backend "remote" {
        # The name of your Terraform Cloud organization.
        organization = "infra.mavenwave.net"

        # The name of the Terraform Cloud workspace to store Terraform state files in.
        workspaces {
          name = "aws-fsx-accelerator"
        }
      }
    }