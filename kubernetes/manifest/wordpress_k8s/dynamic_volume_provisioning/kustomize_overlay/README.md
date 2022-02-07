# wordpress

## git clone 
下記のコマンドで wordpress_k8s ディレクトリのみ clone
```bash
declare MKDIR=github-AY
declare SUBDIR=wordpress_k8s
declare GIT=https://github.com/AbeYuki/repository.git
bash -c \
"mkdir $MKDIR
git -C $MKDIR/ init 
cat <<EOF> $MKDIR/.git/config 
[core]
        repositoryformatversion = 0
        filemode = false
        bare = false
        logallrefupdates = true
        symlinks = false
        ignorecase = true
        sparsecheckout = true
EOF
git -C $MKDIR remote add origin $GIT
echo $SUBDIR > $MKDIR/.git/info/sparse-checkout
git -C $MKDIR pull origin master" ;\
unset MKDIR SUBDIR GIT
```

<br>
<br>
<br>


# QuickStart
## 前提条件
Dyanamic Volume Provisioning  
cert-manager install  
Kubernetes =< 1.14  

## 1. kustomizetion.yaml 修正
testing/kustomization.yaml の patchesStrategicMerge を修正  
    
PersistentVolumeClaim 修正  
```
spec/spec/storageClassName
```

ClusterIssuer 修正
```
spec/acme/email
spec/solvers/0/http01/ingress/class
```

Ingress 修正
```
spec/tls/0/hosts
spec/rules/0/host
```

<br>

## 2. deploy
deploy
```
kubectl apply -f testing/namespace && kubectl apply -k testing/
```
  