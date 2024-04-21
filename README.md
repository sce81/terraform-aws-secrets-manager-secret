# terraform aws module secrets manager secret

AWS Terraform module for creating secrets in Secrets Manager
Intended use case is to create a placeholder secret in Terraform but to manage the secret contents outside of Terraform. 
This simplifies automation in that a secret is created in a set location, but without committing its contents to VCS.


## Getting started

This module is intended to create an AWS Secrets Manager Secret Key & Secret.
Terraform will ignore changes made outside of Terraform. 

Resources
- aws_secretsmanager_secret
- aws_secretsmanager_secret_version


### Prerequisites

Terraform ~> 1.8.0

### Tested

Terraform ~> 1.8.1

### Installing

This module should be called by a terraform environment configuration via github
```  
      source           = "git@github.com:sce81/terraform-aws-secrets-manager-secret.git"
```
or Terraform Cloud
```
      source           = "app.terraform.io/HashiCorp_AWS_Org/secrets-manager-secret/aws"
      version          = "1.0.1"
```



##### Usage

   module "secret" {
     source            = "app.terraform.io/HashiCorp_AWS_Org/secrets-manager-secret/aws"
     version           = "1.0.1"
     name              = var.name
     env               = var.env
     kms_key_id        = module.kms-key.name
     extra_tags        = local.extra_tags
   }


##### Outputs

     arn               = aws_secretsmanager_secret.main.arn
     id                = aws_secretsmanager_secret.main.id


