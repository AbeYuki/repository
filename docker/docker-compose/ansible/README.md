# 1. build
```bash
docker-compose build --no-cache
```
<br>

# 2. docker-compose up
```bash
docker-compose up -d
```
<br>

# 3. ansibleコンテナにログイン
```bash
docker exec -it ansible /bin/bash
``` 
<br>

# 4. ansibleコンテナ実行し、ssh設定を行う
### 各nodeコンテナの hosts 情報を ansible コンテナの hosts ファイルへ追記
```bash
/bin/bash -c "ssh  node01 tail -1 /etc/hosts >> /etc/hosts && ssh node02 tail -1 /etc/hosts >> /etc/hosts  && ssh  node03 tail -1 /etc/hosts >> /etc/hosts"
```
### build時に作成した公開鍵を各nodeコンテナのauthorizekeyに記載
```bash
/bin/bash -c "scp -pr /root/.ssh root@node01:~/ && scp -pr /root/.ssh root@node02:~/ && scp -pr /root/.ssh root@node03:~/"
```
<br>

# 5. ansible 疎通確認
```bash
ansible node -m ping
```
<br>

# 6. playbook
```bash
ansible-playbook install.yaml
```
<br>

# 備考
4.にて鍵認証のセットアップ手順を記載しているが、各Nodeへのssh設定はパスワード認証としている  
秘密鍵を用いたssh_configでの疎通確認は各人で設定をお願いします。