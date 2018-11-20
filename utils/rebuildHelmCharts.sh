#!/bin/bash
GOODPATH=`pwd`
KUBEDGEVERSION=0.1.0
cd kubeplay; helm package charts/kubeplay-amd64/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge1/; cd $GOODPATH
cd kubedge; helm package charts/kubedge-amd64/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge1/; cd $GOODPATH
cd kubesim_nats; helm package charts/kubesim-nats-pub-amd64 --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge1/; cd $GOODPATH
cd kubesim_nats; helm package charts/kubesim-nats-sub-amd64 --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge1/; cd $GOODPATH
cd kubesim_linkio; helm package charts/kubesim-linkio-amd64 --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge1/; cd $GOODPATH
# cd kubesim_blinkt; helm package charts/kubesim-blinkt-amd64 --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge1/; cd $GOODPATH
# 
cd kubesim_5gc; helm package charts/kubesim-5gc-amd64/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
cd kubesim_elte; helm package charts/kubesim-elte-amd64/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
cd kubesim_lte; helm package charts/kubesim-lte-amd64/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
cd kubesim_epc; helm package charts/kubesim-epc-amd64/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
cd kubesim_nr; helm package charts/kubesim-nr-amd64/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
# 
cd kubedge_utils; helm package charts/prometheus-amd64/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kubedge_utils; helm package charts/kubernetes-dashboard-amd64/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kubedge_utils; helm package charts/fluentd-amd64/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kubedge_utils; helm package charts/grafana-amd64/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kubedge_utils; helm package charts/weave-scope-amd64/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kubedge_utils; helm package charts/nats-operator-amd64 --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kubedge_utils; helm package charts/nats-streaming-amd64 --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
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
git push origin HEAD:refs/for/amd64
cd $GOODPATH
