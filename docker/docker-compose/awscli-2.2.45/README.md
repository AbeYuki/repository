# aws cli を実行するための offcial container
## 目的
コンテナ起動状態を維持した状態で aws cli を利用するための docker-compose

## entrypoint
Docker image では entrypont で aws コマンドを実行しているが、起動を維持するために entrypoint を bash で
上書きすることでコンテナを維持している。

## volume
ローカルの ~/.aws フォルダをコンテナの /root/.aws にマウントしている  

## credentials
ローカルの ~/.aws/credentials に クレデンシャル情報を記載
```bash
[default]
aws_access_key_id=xxxxxxxxxxxxxxxx
aws_secret_access_key=xxxxxxxxxxxxxxxx
```

# Example 
## コンテナにログイン
```bash
docker exec -it aws-cli bash
```
## cli 実行
```bash
bash-4.2# aws --version
aws-cli/2.2.45 Python/3.8.8 Linux/5.4.0-1044-raspi docker/aarch64.amzn.2 prompt/off
```

