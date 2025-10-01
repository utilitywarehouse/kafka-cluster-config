# Experimental MSK cluster
This module holds the configuration of the experimental MSK cluster.

Full instructions on how to setup and use the experiental MSK cluster at
[here](https://github.com/utilitywarehouse/documentation/blob/master/infra/operational/kafka-upgrade.md)

## Applying configuration to the exp cluster
Since this is temporary and inteded for experimentation, the configuration is
applied manually via the `msk-admin-client`.

The setup is very close the shared-msk cluster, so these steps are based on the
[TERRAFORM_DEBUG](https://github.com/utilitywarehouse/kafka-cluster-config/tree/master/prod-aws/kafka-shared-msk/TERRAFORM_DEBUG.md)
configuration, which contains more detail and context.

## Setup the terraform module in `msk-admin-client`

1. **Start a shell session** in the `msk-admin-client` pod:
    ```bash  
    kubectl exec -n pubsub --context=dev-aws -c tf-kafka-config -it msk-admin-client-0 -- /bin/ash 
    ```
2. **Checkout this project in /tmp** (it must be anywhere else than `/uwgh` to not interfere with git-sync)
    ```bash  
    cd /tmp
    git clone https://github.com/utilitywarehouse/kafka-cluster-config.git
    ```
2. **Cd into this module**
    ```bash  
    cd kafka-cluster-config/dev-aws/sys-msk-exp
    ```
3. **(Optional) checkout to your development branch**
    ```bash  
    git checkout my-dev-branch
    ```
4. **Initialize terraform** (with the standard cli)
    ```bash  
    terraform init -upgrade
    ```
## Profit
Use terraform locally on the pod to plan/apply the module
