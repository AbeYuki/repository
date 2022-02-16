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
for i in node01 node02 node03
do
    scp -pr /root/.ssh/authorized_keys root@$i:/root/.ssh/authorized_keys
done
```
<br>

### 上記で秘密鍵認証が完了したので、 パスワード認証を no に変更し、hosts 設定( ansible コンテナから実行)
```bash
for i in node01 node02 node03
do
    ssh $i "sed -i -e 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config"
    ssh $i service sshd reload
done \
&& bash -c "ssh node01 tail -1 /etc/hosts && ssh node02 tail -1 /etc/hosts && ssh node03 tail -1 /etc/hosts" >> /etc/hosts \
&& bash -c "scp -pr /etc/hosts root@node01:/etc/hosts && scp -pr /etc/hosts root@node02:/etc/hosts && scp -pr /etc/hosts root@node03:/etc/hosts"
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