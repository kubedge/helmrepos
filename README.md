# HELM REPOS

## Branches

- arm32v7: contains the helm repos from arm32v7 / RPI 3B+
- adm64: contains the helm repos from amd64
- master: The master branch has been deleted from this repo to avoid
confusion with the amd64 branch since the team did not address the
issue yet of being able to have charts that identical for adm64 and
arm32v7

## Add official stable and incubator helm charts

```bash
helm repo remove stable
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo update
```

```bash
helm repo remove incubator
helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com/
helm repo update
```

## Install arm32v7 helm charts

```bash
for reponame in hack4easy kubedge1 kubedge2 kubedge3 kubedge4
do
helm repo remove $reponame
helm repo add $reponame "https://raw.githubusercontent.com/kubedge/helmrepos/arm32v7/$reponame/"
done
helm repo update
```


## List installed helm repo

```bash
$ helm repo list

NAME            URL
stable          https://kubernetes-charts.storage.googleapis.com
kubedge1        https://raw.githubusercontent.com/kubedge/helmrepos/arm32v7/kubedge1/
hack4easy       https://raw.githubusercontent.com/kubedge/helmrepos/arm32v7/hack4easy/
incubator       https://kubernetes-charts-incubator.storage.googleapis.com/
```

## Build arm32v7 helm charts

Assuming kubedge/helmrepos and kubedge/kubeplay GitHub repos have been cloned under the
same folder:

```bash
cd helmrepos/
git checkout arm32v7
git reset --hard origin/arm32v7
cd ..
```

```bash
cd kubeplay/
git checkout arm32v7
git reset --hard origin/arm32v7
helm package charts/kubeplay-arm32v7/ --app-version 0.1.0 --destination ../helmrepos/kubedge1/
cd ..
```

```bash
cd helmrepos/kubedge1/
helm repo index .
git add index.yaml kubeplay-arm32v7-0.1.0.tgz
```
