locals {
  ##### Azureログイン情報 #####
  login = {
    subscription_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    tenant_id       = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  }

  location = {
    main = "japaneast"
    sub  = "japanwest"
  }

  ##### リソースグループ #####
  resource_group = {
    rg1 = {
      name     = "sample-rg"
      location = local.location.main
    }
  }

  ##### 仮想ネットワーク #####
  virtual_network = {
    vnet1 = {
      name               = "sample-vnet"
      resource_group_key = "rg1"
      address_space      = ["10.0.0.0/23"]
    }
  }
}