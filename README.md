
# Welcome to your CloudGo AI Project: CloudGo.ai AWS Migration

## Project Info

**URL**: https://cloudgoai.app/Home#Chat/zCoSKtPvcw0iW7fJMkj4

This repository contains a **Terraform project generated with CloudGo AI**.

It is scaffolded with:
- **Deployment scripts** for installing required tools and deploying infrastructure.
- **Validation scripts** (linting, security checks) to ensure correctness.


For more details about the Terraform code itself, see the [terraform/README.md](./terraform/README.md).

---

## Quickstart

You can use this project locally or though github actions.

### Local

```sh
# 1. Clone this repository
git clone <your-repo-url>
cd CloudGo.ai AWS Migration

# 2. Install dependencies
./scripts/install.sh

# 3. Validate the configuration
./scripts/check.sh

# 4. Deploy the infrastructure
./scripts/deploy.sh
```

Read the [github workflow doc](docs/cicd-setup-aws.md) for more details on how to use the github actions instead.

---

## Requirements

- Terraform (installed automatically via scripts/install.sh, but you can install manually if preferred).
- Cloud provider CLI (AWS CLI, gcloud CLI, or Azure CLI depending on the selected provider).
- GitHub Actions (optional) for CI/CD automation.
- Infracost if you want to re-run or adjust cost estimation.

---

## How can I edit this code?

You can work with this project in multiple ways:

**Use CloudGo AI**  
Return to your [CloudGo AI Project](https://cloudgoai.app/Home#Chat/zCoSKtPvcw0iW7fJMkj4) and keep prompting.  
Any changes made in CloudGo AI can be committed with the github button to this repo.

**Use your preferred IDE**  
Clone this repo locally and push changes. All changes will remain compatible with CloudGo AI.  

**Edit directly in GitHub**  
Navigate to any file in GitHub, click the pencil icon, make edits, and commit.

**Use GitHub Codespaces**  
Click the "Code" button in your repository, choose "Codespaces", and launch a new development environment directly in your browser.

---

## Architecture Diagram
![inkdrop](https://github.com/NicholasMicali/CloudGo.ai-AWS-Migration/blob/main/docs/inkdrop-aws.png)

---

## Generation Prompt
The following prompt was used to generate this project:

Help me build a Terraform project based on this doc

---

## References

- [Deployment instructions](./deploy.md)  
- [Provider-specific deployment instructions](./docs/deploy_aws.md)  
- [Cost estimate (Infracost)](./docs/infracost.json)  
- [Terraform project README](./terraform/README.md)  

---

## Terraform Documentation Found
| Metric                               | Value                   |
|--------------------------------------|-------------------------|
| Total Files Analyzed                 | 6,834         |
| Total Results Found                  | 103         |
| Total Selected Files                 | 22           |

## Documentation Links
- [develop structure.html](https://terraform.io/language/modules/develop/structure.html)
- [terraform-aws-rds README.md](https://github.com/terraform-aws-modules/terraform-aws-rds)
- [terraform-aws-acm README.md](https://github.com/terraform-aws-modules/terraform-aws-acm)
- [resources appautoscaling_target.html.markdown](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target)
- [terraform-aws-vpc README.md](https://github.com/terraform-aws-modules/terraform-aws-vpc)
- [resources s3_bucket_versioning.html.markdown](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning)
- [terraform-aws-cloudwatch README.md](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch)
- [terraform-aws-cloudfront README.md](https://github.com/terraform-aws-modules/terraform-aws-cloudfront)
- [resources s3_bucket_lifecycle_configuration.html.markdown](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration)
- [resources appautoscaling_policy.html.markdown](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy)
- [terraform-aws-ecs README.md](https://github.com/terraform-aws-modules/terraform-aws-ecs)
- [db_instance README.md](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_instance)
- [resources vpc_block_public_access_exclusion.html.markdown](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_block_public_access_exclusion)
- [resources amplify_domain_association.html.markdown](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/amplify_domain_association)
- [resources s3_bucket.html.markdown](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)
- [db_instance_role_association README.md](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_instance_role_association)
- [develop usage.html](https://terraform.io/language/modules/develop/usage.html)
- [log-group README.md](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/tree/master/modules/log-group)
- [resources vpc_endpoint_private_dns_verification.html.markdown](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint_private_dns_verification)
- [metric-alarm README.md](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/tree/master/modules/metric-alarm)
- [terraform-aws-apigateway-v2 README.md](https://github.com/terraform-aws-modules/terraform-aws-apigateway-v2)
- [resources amplify_app.html.markdown](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/amplify_app)

