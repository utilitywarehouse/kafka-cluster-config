## How to work with Terraform
This guide is intended for **unexpected** situations, such as fixing the state or debugging the Kafka provider by the PubSub administrators.

Under normal circumstances, we utilize the [Terraform Applier](https://github.com/utilitywarehouse/terraform-applier) to apply changes upon merge.

## Introduction

We have a pre-configured setup for this Terraform project, connecting to the MSK cluster within the PubSub namespace. This setup is represented by the stateful set `msk-admin-client`, available in both [dev](https://github.com/utilitywarehouse/kubernetes-manifests/tree/master/dev-aws/pubsub/msk/msk-admin-client) and [prod](https://github.com/utilitywarehouse/kubernetes-manifests/tree/master/prod-aws/pubsub/msk/msk-admin-client).

This setup was initially created for manually deleting topics in `prod`, but it can also be employed for debugging the Terraform modules as needed.

However, it’s essential to note that this setup always checks out the `main` branch of the project using git-sync as a sidecar container under the `uwgh` folder. For more details, see [manifest](https://github.com/utilitywarehouse/dev-enablement-mono/blob/5851d9baaad23be0722e395da9e14f221860930f/services/msk-admin-client/k8s-manifests/statefulset.yaml#L99-L116).

### Steps to Initiate a Debug Session

1. **Start a shell session** in the pod:
    ```bash  
    kubectl exec -n pubsub --context=dev-aws -c tf-kafka-config -it msk-admin-client-0 -- /bin/sh 
    ```
2. **Checkout this project in /tmp** (it must be anywhere else than `/uwgh` to not interfere with git-sync)
    ```bash  
    cd /tmp
    git clone https://github.com/utilitywarehouse/kafka-cluster-config.git
    ```
3. **Initialise the terraform module** you're interested in:
    ```bash
    source /scripts/tf.sh
    export REPO_ROOT=/tmp/kafka-cluster-config/
    tfinit the_module
    ```
Within this shell, you can freely use the `terraform` and `git` commands to conduct the necessary debugging.

