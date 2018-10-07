# HELM REPOS

## Branches

- adm64 contains the helm repos from amd64
- arm32v7 contains the helm repos from arm32v7 / RPI 3B+

## Add master branch helm charts

# TBD

## Add adm64 helm charts

# TBD

## Add arm32v7 helm charts

```bash
cd helmrepos/
git checkout arm32v7
git reset --hard origin/arm32v7
cd ..
cd kubeplay/
git checkout arm32v7
git reset --hard origin/arm32v7
helm package charts/kubeplay-arm32v7/ --app-version 0.1.0 --destination ../helmrepos/kubedge1/
cd ..
cd helmrepos/
cd kubedge1/
helm repo index .
git add index.yaml kubeplay-arm32v7-0.1.0.tgz
```
