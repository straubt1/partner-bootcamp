# Demo

| Requirement                                                                          | Complete   | Notes                  |
|--------------------------------------------------------------------------------------|------------|------------------------|
| Use Terraform OSS to provision 2 Vault clusters in AWS                               | Done       | Scalable solution      |
| ... with performance replication enabled.                                            | Incomplete | Potential TLS Error    |
| Use Shamir secret sharing to unseal.                                                 | Done       | KMS Auto-Unseal        |
| Ensure TLS is enabled for all components.                                            | Done       | *.bootcamp.tstraub.com |
| Enable static kv engine at ‘secret’ path.                                            | Done       | V2 of the KV engine    |
| Configure AWS secret engine to provide RW access to an S3 bucket named ‘movies’.     | Done       | Scoping policy needs   |
| Address the ability of Vault to encrypt large files during the initial conversation. | Done       | 10MB for now           |

TODO:
- Identify issues with performance replication
- Give github user more perms
- revoke root token










## Automatics

- Github Authentication
- Auto unseal

## Shamir secret sharing

Auto unseal with KMS

## Ensure TLS is enabled for all components

*.bootcamp.tstraub.com

## Enable statice kv engine

'secret' path for kv is the default.
Vesion 2

## AWS Secret engine

Bucker named 'movies' -> 'terraform-20190125023119205300000001'

```sh
vault read aws/creds/s3-access-role
vault lease revoke -prefix aws/creds/s3-access-role
```

## Encrypt Large files

max_request_size in listener block
