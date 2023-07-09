terraform {
  backend "consul" {
    address = "consul.cicd.aws.vindicia.com"
    scheme  = "https"
    path    = "terraform_state/vcicd/netops/slm-staging-4545/axonius"
  }
}