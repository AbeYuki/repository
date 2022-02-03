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

# 4. ansible コンテナで以下コマンドを実行し、ssh・ hosts 設定を行う

### build 時に作成した公開鍵を各 node コンテナの authorizekey に記載
※[fingerprint] は 「 yes 」にする。
※パスワードは 「 node 」としています。  
```bash
/bin/bash -c "scp -pr /root/.ssh/authorized_keys root@node01:/root/.ssh/authorized_keys && scp -pr /root/.ssh/authorized_keys root@node02:/root/.ssh/authorized_keys && scp -pr /root/.ssh/authorized_keys root@node03:/root/.ssh/authorized_keys"
```
<br>

### 上記で秘密鍵認証が完了したので、 パスワード認証を no に変更( ansible コンテナから実行)
```bash
ssh  node01 "sed -i -e 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config"  \
&& ssh node02 "sed -i -e 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config" \
&& ssh  node03 "sed -i -e 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config"
```
<br>

### sshd_config の reload ( ansible コンテナから実行)
```bash 
ssh  node01 service sshd reload  \
&& ssh node02 service sshd reload \
&& ssh node03 service sshd reload

```
<br>

# 5. ansible コンテナから node コンテナに対して疎通確認
```bash
ansible node -m ping
```
<br>

# 6. ansible コンテナから playbook を実行
```bash
ansible-playbook install.yaml
```
<br>