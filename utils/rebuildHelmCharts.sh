#!/bin/bash
GOODPATH=`pwd`
cd kubeplay; helm package charts/kubeplay-arm32v7/ --app-version 0.1.0 --destination $GOODPATH/helmrepos/kubedge1/; cd $GOODPATH
cd kubedge; helm package charts/kubedge-arm32v7/ --app-version 0.1.0 --destination $GOODPATH/helmrepos/kubedge1/; cd $GOODPATH
cd kubesim_5gc; helm package charts/kubesim-5gc-arm32v7/ --app-version 0.1.0 --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
cd kubesim_elte; helm package charts/kubesim-elte-arm32v7/ --app-version 0.1.0 --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
cd kubesim_lte; helm package charts/kubesim-lte-arm32v7/ --app-version 0.1.0 --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
cd kubesim_epc; helm package charts/kubesim-epc-arm32v7/ --app-version 0.1.0 --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
cd kubesim_nr; helm package charts/kubesim-nr-arm32v7/ --app-version 0.1.0 --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
cd kube-rpi;helm package charts/prometheus-arm32v7/ --app-version 0.7.5 --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kube-rpi;helm package charts/kubernetes-dashboard-arm32v7/ --app-version 0.7.5 --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kube-rpi;helm package charts/fluentd-arm32v7/ --app-version 1.0.0 --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kube-rpi;helm package charts/grafana-arm32v7/ --app-version 1.17.4 --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
for i in kubedge1 kubedge2 hack4easy
do
   cd helmrepos/$i
   helm repo index .
   git add index.yaml
   git add *.tgz
   cd $GOODPATH
done
cd helmrepos
git commit -a -m "update charts"; git push
cd $GOODPATH
