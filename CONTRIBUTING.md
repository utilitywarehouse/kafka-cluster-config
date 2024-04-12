## Linting

Linting is handled via `pre-commit`. Follow the [install
instructions](https://pre-commit.com/#install), and additionally [install
Terraform](https://developer.hashicorp.com/terraform/install) and [tflint](https://github.com/terraform-linters/tflint?tab=readme-ov-file#installation) then install and
run the hooks:

``` console
$ pre-commit install
$ pre-commit run --all-hooks
```
