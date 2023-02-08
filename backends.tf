terraform {
  cloud {
    hostname     = "infra.mavenwave.net"
    organization = "infra-mavenwave"

    workspaces {
      name = "aws-fsx-accelerator"
    }
  }
}