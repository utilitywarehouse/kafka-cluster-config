### Running terraform plan locally

1. Run `make okta-aws-cli-login` from the `terraform` repo dir. More info [here](https://github.com/utilitywarehouse/terraform/tree/master/aws#okta-login)
2. Export AWS profile `export AWS_PROFILE=uw-dev-system-admin`
3. Run `make certs` to download Kafka certificates
4. Forward kube services locally

```
sudo -E kubefwd svc --context exp-1-merit -n pubsub
```

5. Run `make init`, then `make plan`
   💡 If you get the `connection refused` or `no such host` error for one of the hosts, try rerunning `kubefwd` or
   inspect your `/etc/hosts` file and make sure you've got the entries below. Add them if missing.

```
127.1.27.7 kafka-shared-0.kafka-shared-headless.pubsub.svc.cluster.merit
127.1.27.8 kafka-shared-1.kafka-shared-headless.pubsub.svc.cluster.merit
127.1.27.9 kafka-shared-2.kafka-shared-headless.pubsub.svc.cluster.merit
```
