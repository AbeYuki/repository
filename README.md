本 repository はインフラ周りのコードを集約管理しています。

<br>  

必要なサブディレクトリは以下のコマンドで clone して下さい。  
※サンプルでは github-AY ディレクトリを作成し、redmine_k8s サブディレクトリのみを clone します。  
<br>  
```
MKDIR 変数はローカルに作成するディレクトリ名  
SUBDIR 変数は取得したいサブディレクトリ名  
GIT 変数は取得したいプロジェクト URL  
```

```bash
declare MKDIR=github-AY
declare SUBDIR=redmine_k8s
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
