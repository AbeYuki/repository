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

## 1. kustomizetion 修正
kustomization.yaml の patchesStrategicMerge を修正  
    
ingress の hosts hosts をドメイン名に修正  
```
spec/tls/hosts
spec/tls/rules/hosts
```
ClusterIssuer 修正  
連携する email 、ingress-contoroller の class を修正 
```
spec/acme/email
spec/acme/solvers/http01/ingress/class
```

<br>

## 2. ingress の annotations 修正
cert-manager と連携するには issuer または cluster issuer 名を ingress の annotations に設定する必要がある。  
ingress の annotation 設定は transformer-annotations.yaml で行う。  
annotations は kustomize に記載している [prefix + cluster-issuer + suffix] とする。    

transformer-annotations.yaml
```
annotations/cert-manager.io\/cluster-issuer/
```

## 3. deploy
```
apply -f namespace && apply -k ./
```
  
<br>
<br>
<br>

# 自分用に kustomize 調整

## 1. kustomizetion 修正
kustomization.yaml の patchesStrategicMerge を修正  
    
ingress の hosts,hosts をドメイン名に修正  
```
spec/tls/hosts
spec/tls/rules/hosts
```
ClusterIssuer 修正  
連携する email 、ingress-contoroller の class を修正 
```
spec/acme/email
spec/acme/solvers/http01/ingress/class
```

<br>

## 2. ingress の annotations 修正
cert-manager と連携するには issuer または cluster issuer 名を ingress の annotations に設定する必要がある。  
ingress の annotation 設定は transformer-annotations.yaml で行う。  
annotations は kustomize に記載している [prefix + cluster-issuer + suffix] とする。    

transformer-annotations.yaml
```
annotations/cert-manager.io\/cluster-issuer/
```

## 3. namespace 調整

namespace.yaml
```
metadata/name
```

<br>

## 4. kustomization.yaml で各リソース・イメージの調整
全体のリソース名の調整は kustomization.yamlで行う。  
preffix,suffix,labels,secretGenerator 等を調整する

kustomization.yaml
```
namespace
namePrefix
nameSuffix
commonLabels
secretGenerator
```

images のバージョンを調整する
```
images/name/nweName/newTag
```

<br>

## 5. deploy
```
apply -f namespace && apply -k ./
```
  
<br>
<br>
<br>

自分用に kustomize が整えば、 namespace, suffix, ingress の調整で管理されたアプリケーションを deploy できます。 