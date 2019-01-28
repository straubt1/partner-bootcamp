# Partner Bootcamp Vault Exercise

## Mock Engagement

Here is the Mock Engagement Scenario and relevant credentials for Day 3 of the Partner Bootcamp.

**Customer Background**

Arnold is a senior level manager of the special FX business unit, and authorized purchase of Vault to help protect their rendering and content distribution.
James is the SRE in charge of administering these platforms.

The use cases important to them were static secrets, and dynamic AWS secrets providing access to an S3 bucket.
They’d also like to encrypt complete HD movies using Vault encryption as a service.

**Assignment**

Use Terraform OSS to provision 2 Vault clusters in AWS, with performance replication enabled.
Use Shamir secret sharing to unseal.
Ensure TLS is enabled for all components.
Enable static kv engine at ‘secret’ path.
Configure AWS secret engine to provide RW access to an S3 bucket named ‘movies’.
Address the ability of Vault to encrypt large files during the initial conversation.

**Stretch Goals**

Demonstrate how to use Vault’s transit engine to encrypt a 10MB file.

### Questions

PGP - 

1. What does your network landscape look like, do you have an available vnet we can use with space?
  VPC, default vpc
1. What region would you like to deploy? same?
  1 data center, west
1. Is there any on-premise connectivity required? No
1. What type of application and machines will be using Vault?
  MSI 
1. How will they authenticate to vault?
1. Self signed certs? domain?
  anything.com
1. Does the S3 bucket already exist?
  create it
1. How big of files do you need to encrypt?
   10 MB
   Read 10 GB, envelope encryption, transit data keys


### Resources

- <https://github.com/hashicorp/vault-guides/blob/master/operations/aws-kms-unseal-ha/terraform/README.md>

