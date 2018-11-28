#!/bin/bash
GOODPATH=`pwd`
KUBEDGEVERSION=0.1.0
cd kubeplay; helm package charts/kubeplay-arm32v7/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge1/; cd $GOODPATH
cd kubedge; helm package charts/kubedge-arm32v7/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge1/; cd $GOODPATH
cd kubesim_nats; helm package charts/kubesim-nats-pub-arm32v7 --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge1/; cd $GOODPATH
cd kubesim_nats; helm package charts/kubesim-nats-sub-arm32v7 --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge1/; cd $GOODPATH
cd kubesim_linkio; helm package charts/kubesim-linkio-arm32v7 --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge1/; cd $GOODPATH
# 
cd kubesim_5gc; helm package charts/kubesim-5gc-arm32v7/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
cd kubesim_elte; helm package charts/kubesim-elte-arm32v7/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
cd kubesim_lte; helm package charts/kubesim-lte-arm32v7/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
cd kubesim_epc; helm package charts/kubesim-epc-arm32v7/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
cd kubesim_nr; helm package charts/kubesim-nr-arm32v7/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
cd kubedge_utils; helm package charts/arpscan-arm32v7/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
# 
cd kubedge_utils; helm package charts/prometheus-arm32v7/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kubedge_utils; helm package charts/kubernetes-dashboard-arm32v7/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kubedge_utils; helm package charts/fluentd-arm32v7/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kubedge_utils; helm package charts/grafana-arm32v7/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kubedge_utils; helm package charts/weave-scope-arm32v7/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kubedge_utils; helm package charts/nats-operator-arm32v7 --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kubedge_utils; helm package charts/nats-streaming-arm32v7 --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
for i in kubedge1 kubedge2 hack4easy
do
   cd helmrepos/$i
   helm repo index .
   git add index.yaml
   git add *.tgz
   cd $GOODPATH
done
cd helmrepos
git commit -a -m "update charts"
git push origin HEAD:refs/for/arm32v7
cd $GOODPATH
