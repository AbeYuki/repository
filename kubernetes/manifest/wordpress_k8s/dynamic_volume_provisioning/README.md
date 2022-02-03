# wordpress

## git clone 
下記のコマンドで wordpress ディレクトリのみ clone
```bash
declare MKDIR=github-AY
declare SUBDIR=wordpress
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

## 1. ingress の hosts 設定
hosts をドメイン名に変更

ingress-tls.yaml
```
spec/tls/hosts
spec/tls/rules/hosts
```

## 2. ClusterIssuer の設定
連携する email 設定
ingress-contoroller の class 設定 


cluster-issuer.yaml
```
spec/acme/email
spec/acme/solvers/http01/ingress/class
```

## 3. deploy
```
apply -f namespace && apply -k ./
```
  
<br>
<br>
<br>

# kustomize

## 1. namespace 修正

namespace.yaml
```
metadata/name
```

## 2. ingress の annotations 修正
ingress の annotation 設定は transformer-annotations.yaml で行う  
annotations は kustomize に記載している [prefix + cluster-issuer + suffix] とする。

transformer-annotations.yaml
```
annotations/cert-manager.io\/cluster-issuer/
```

## 3. kustomization 修正
namespace, labels, prefix, suffix を修正  
kustomization.yaml
```
namespace
namePrefix
nameSuffix
commonLabels
```
transformer-annotations.yaml
```
annotations/
```
transformer-label.yaml
```
labels/
```

## 4. ingress の hosts 設定
hosts をドメイン名に変更

ingress-tls.yaml
```
spec/tls/hosts
spec/tls/rules/hosts
```

## 5. ClusterIssuer の設定
連携する email 設定
ingress-contoroller の class 設定 


cluster-issuer.yaml
```
spec/acme/email
spec/acme/solvers/http01/ingress/class
```

## 6. deploy
```
apply -f namespace && apply -k ./
```


自分用に kustomize が整えば、 namespace, suffix, ingress の調整で管理されたアプリケーションを deploy できます。 