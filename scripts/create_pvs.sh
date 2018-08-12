#!/bin/sh


PV_ACCESS_MODE=$1

for num in $(seq $2 $3)
do

cat<<EOF | oc create -f -
apiVersion: v1
kind: PersistentVolume
metadata:
  name: "pv0${num}"
spec:
  capacity:
    storage: 5Gi
  accessModes:
    - "${PV_ACCESS_MODE}"
  persistentVolumeReclaimPolicy: Recycle
  nfs:
    path: /srv/nfs
    server: "support1.${GUID}.internal"
EOF

done
