## Description

Here, In this template, we will create a Bastion resource using the terraform module within a subscription.

---

##### Pre-Requisite

* Azure Account
* Pre Login into your Azure Account

---
### Steps

* Login into your Azure portal.
* You can either use a portal or use the service principal to login using your credentials.
* Clone the Repository and switch to module directory.
* Then run the terraform commands to create the resource.
* Commands :
```
-  terraform init 
-  terraform plan 
-  terraform apply 
``` 

* Command to check the bastion resource is created within the subscription:

`az network bastion list -o table `


## Configuration

The following table lists the configurable parameters of the Bastion module with their default values.

| Parameters                                    | Description                                                | Type   | Required | Default    |
|-----------------------------------------------|------------------------------------------------------------|--------|----------|------------|
| name                                          | Common Name for all the resources                          | string | Yes      |            |
| location                                      | Location of resource group                                 | string | Yes      |            |
| vnet_name                                     | VNET name                                                  | string | Yes      |            |
| vnet_rg_name                                  | VNET resource group name                                   | string | Yes      |            |

---