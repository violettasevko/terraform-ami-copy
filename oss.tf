locals {
  cluster_name      = "opensearch"
  cluster_domain    = "example.com"
  saml_entity_id    = "https://sts.windows.net/XXX-XXX-XXX-XXX-XXX/"
  saml_metadata_url = "https://login.microsoftonline.com/XXX-XXX-XXX-XXX-XXX/federationmetadata/2007-06/federationmetadata.xml?appid=YYY-YYY-YYY-YYY-YYY"
}

data "aws_region" "current" {}

data "http" "saml_metadata" {
  url = local.saml_metadata_url
}

provider "elasticsearch" {
  url                   = module.opensearch.cluster_endpoint
  aws_region            = data.aws_region.current.name
  healthcheck           = false
}

module "opensearch" {
  source  = "idealo/opensearch/aws"
  version = "~> 1.0"

  cluster_name    = local.cluster_name
  cluster_domain  = local.cluster_domain
  cluster_version = "1.3"

  saml_entity_id        = local.saml_entity_id
  saml_metadata_content = data.http.saml_metadata.body

  indices = {
    example-index = {
      number_of_shards   = 1
      number_of_replicas = 0
    }
  }
}
