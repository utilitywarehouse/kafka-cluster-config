## How to work with Terraform
This guide is intended for **unexpected** situations, such as fixing the state or debugging the Kafka provider by the PubSub administrators.

Under normal circumstances, we utilize the [Terraform Applier](https://github.com/utilitywarehouse/terraform-applier) to apply changes upon merge.

## Introduction

We have a pre-configured setup for this Terraform project, connecting to the MSK cluster within the PubSub namespace. This setup is represented by the stateful set `tf-kafka-config-admin`, available in both [dev](https://github.com/utilitywarehouse/kubernetes-manifests/tree/master/dev-aws/pubsub/tf-kafka-config-admin) and [prod](https://github.com/utilitywarehouse/kubernetes-manifests/tree/master/prod-aws/pubsub/tf-kafka-config-admin).

This setup was initially created for manually deleting topics in `prod`, but it can also be employed for debugging the Terraform modules as needed.

However, it’s essential to note that this setup always checks out the `main` branch of the project using git-sync as a sidecar container. For more details, see [manifest](https://github.com/utilitywarehouse/dev-enablement-mono/blob/1f026eb42591444aef2e9ae644d0c7b78c25a210/services/tf-kafka-config-admin/k8s-manifests/statefulset.yaml#L61-L78).

### Steps to Initiate a Debug Session

1. **Disable automatic sync** for the `pubsub` ArgoCD project in the environment you wish to debug. For example, in the dev environment:
    ```bash  
    kubectl --context dev-aws -n pubsub patch --type='merge' applications.argoproj.io pubsub -p "{\"spec\":{\"syncPolicy\":{\"automated\":null}}}"  
    ```  

2. **Patch the `tf-kafka-config-admin` StatefulSet** to run git-sync just once. You can also change the branch to be checked out by modifying the `GITSYNC_REF` in the patch:
    ```bash  
    kubectl patch --context dev-aws -n pubsub statefulset tf-kafka-config-admin --patch-file=/dev/stdin <<-EOF  
    {  
      "spec": {  
        "template": {  
          "spec": {  
            "initContainers": [  
              {  
                "name": "git-sync",  
                "restartPolicy": null,  
                "env": [  
                  {  
                    "name": "GITSYNC_REF",  
                    "value": "main"  
                  },  
                  {  
                    "name": "GITSYNC_ONE_TIME",  
                    "value": "true"  
                  }  
                ]  
              }  
            ]  
          }  
        }  
      }  
    }  
    EOF  
    ```  

3. **Start a shell session** in the pod for a specific module, also initializing it:
    ```bash  
    MODULE=the_module; kubectl exec -n pubsub --context=dev-aws -it tf-kafka-config-admin-0 -- /bin/sh -c "source /scripts/tf.sh; tfinit ${MODULE}; exec /bin/sh"  
    ```  
   Within this shell, you can freely use the `terraform` and `git` commands to conduct the necessary debugging.

Once you have completed your debugging, remember to **enable automatic sync** in ArgoCD:
```bash  
kubectl --context dev-aws -n pubsub patch --type='merge' applications.argoproj.io pubsub -p "{\"spec\":{\"syncPolicy\":{\"automated\":null}}}"  
