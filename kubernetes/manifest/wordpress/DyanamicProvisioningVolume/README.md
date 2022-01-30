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

# QuickStart
ingress の hosts を設定したいドメイン名に変更

ingress-tls.yaml
```
spec/tls/hosts
spec/tls/rules/hosts
```

deploy 
```
apply -f namespace && apply -k ./
```

# 自分用のkustomize
namespace, labels, preffix, suffix 以下の箇所を修正  
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

deploy 
```
apply -f namespace && apply -k ./
```

ある程度自分用に kustomize が整えば、 namespace, suffix, ingress の調整だけで何個でも管理された wordpress を deploy できます。また、 wordpress だけではなく汎用的に利用できます。 