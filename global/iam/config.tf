terraform {
  backend "remote" {
    organization = "helpfulengineering"

    workspaces {
      name = "tf_live_infra-he-sandbox_global-iam"
    }
  }
}