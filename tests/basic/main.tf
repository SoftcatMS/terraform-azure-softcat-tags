module "tagging" {
  source = "../../"

  softcat_managed_type = "IaC"
  softcat_environment  = "Dev"
  softcat_build_type   = "Greenfield"
}


resource "azurerm_resource_group" "rg-softcat-tag-test1-basic" {
  name     = "rg-softcat-tag-test1-basic"
  location = "UK South"

  tags = module.tagging.softcat_tags
}


resource "azurerm_resource_group" "rg-softcat-tag-test2-basic" {
  name     = "rg-softcat-tag-test2-basic"
  location = "UK South"

  tags = merge(module.tagging.softcat_tags,
    {
      softcat_environment = "Overwrite"
      softcat_monitoring  = "Disabled"
    }
  )
}



