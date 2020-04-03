# Folding@Home on GCP
[Terraform](https://www.terraform.io/) で [Google Cloud Platform](https://cloud.google.com/) の
[Preemptible VM instance](https://cloud.google.com/compute/docs/instances/preemptible) を使って
[Folding@Home](https://foldingathome.org/) を安くぶん回す環境を構築してみる。

## How to deploy

```bash
$ export CLOUDSDK_CORE_PROJECT=<PROJECT_ID>
$ gcloud auth login
$ gcloud project create ${CLOUDSDK_CORE_PROJECT} --name "Folding-At-Home"
$ gcloud beta billing projects link CLOUDSDK_CORE_PROJECT --billing-account=BILLING_ACCOUNT_ID
$ gcloud config set project ${CLOUDSDK_CORE_PROJECT}
$ make enable-apis # take a few minutes to enable APIs
$ gcloud auth application-default login
$ make plan
$ make apply
$ make destroy # cleanup
```
