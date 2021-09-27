# build
docker-compose build --no-cache

# up
docker-compose up -d

# ansibleコンテナにログイン
docker exec -it ansible /bin/bash

# ansibleコンテナ実行
## 各nodeコンテナの hosts 情報を ansible コンテナの hosts ファイルへ追記
/bin/bash -c "ssh  node01 tail -1 /etc/hosts >> /etc/hosts && ssh node02 tail -1 /etc/hosts >> /etc/hosts  && ssh  node03 tail -1 /etc/hosts >> /etc/hosts"
## build時に作成した公開鍵を各nodeコンテナのauthorizekeyに記載
/bin/bash -c "scp -pr /root/.ssh root@node01:~/ && scp -pr /root/.ssh root@node02:~/ && scp -pr /root/.ssh root@node03:~/"

# ansible 疎通確認
ansible node -m ping

# playbook
ansible-playbook install.yaml

# 備考
鍵認証のセットアップ手順を記載しているが、各Nodeへのssh設定はパスワード認証としている  
秘密鍵を用いたssh_configでの疎通確認は各人で設定をお願いします。