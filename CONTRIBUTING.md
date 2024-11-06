## Linting

Linting is handled via `pre-commit`. Follow the [install
instructions](https://pre-commit.com/#install), and additionally [install
Terraform](https://developer.hashicorp.com/terraform/install) and [tflint](https://github.com/terraform-linters/tflint?tab=readme-ov-file#installation) then install and
run the hooks:

``` console
$ pre-commit install
# do a test run on all the files in the repo
$ pre-commit run -a
```
The validations will run, from now on, before each git commit.
