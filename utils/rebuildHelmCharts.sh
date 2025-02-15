#!/bin/bash
GOODPATH=`pwd`
KUBEDGEVERSION=0.1.0
cd kubeplay; helm package charts/kubeplay/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge1/; cd $GOODPATH
cd kubedge; helm package charts/kubedge/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge1/; cd $GOODPATH
cd kubesim_nats; helm package charts/kubesim-nats-pub --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge1/; cd $GOODPATH
cd kubesim_nats; helm package charts/kubesim-nats-sub --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge1/; cd $GOODPATH
cd kubesim_linkio; helm package charts/kubesim-linkio --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge1/; cd $GOODPATH
cd kubesim_blinkt; helm package charts/kubesim-blinkt --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge1/; cd $GOODPATH
# 
cd kubesim_5gc; helm package charts/kubesim-5gc/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
cd kubesim_elte; helm package charts/kubesim-elte/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
cd kubesim_lte; helm package charts/kubesim-lte/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
cd kubesim_epc; helm package charts/kubesim-epc/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
cd kubesim_nr; helm package charts/kubesim-nr/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
cd kubedge_utils; helm package charts/kubedge-arpscan/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/hack4easy/; cd $GOODPATH
# 
cd kubedge_utils; helm package charts/prometheus/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kubedge_utils; helm package charts/kubernetes-dashboard/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kubedge_utils; helm package charts/fluentd/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kubedge_utils; helm package charts/grafana/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kubedge_utils; helm package charts/weave-scope/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kubedge_utils; helm package charts/nats-operator --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
cd kubedge_utils; helm package charts/nats-streaming --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge2/; cd $GOODPATH
#
cd kubeplay; helm package charts/kubeplay/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge3/; cd $GOODPATH
cd kubedge; helm package charts/kubedge/ --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge3/; cd $GOODPATH
cd kubedge-operator-arpscan; helm package chart --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge3/; cd $GOODPATH
cd kubedge-operator-ecds; helm package chart --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge3/; cd $GOODPATH
cd kubedge-operator-embb; helm package chart --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge3/; cd $GOODPATH
cd kubedge-operator-mme; helm package chart --app-version $KUBEDGEVERSION --destination $GOODPATH/helmrepos/kubedge3/; cd $GOODPATH
#
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
#git push origin HEAD:refs/for/main
cd $GOODPATH
