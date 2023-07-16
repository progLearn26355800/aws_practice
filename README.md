# aws 勉強用環境を構築，勉強内容をメモる用のリポジトリでーす


## 構成
![](img/handson_architecture.drawio.svg)

## terraform 用コンテナ作成
以下のコマンドを実施
```
docker-compose up -d
docker exec -it tf_aws bash
```

## terraform 実行コマンド一覧

以下のコマンドは`/IaC/env/<実行したいリソースのディレクトリ>` で実行すること
例) `network`リソースの場合: `cd /IaC/env/network` を実行しておく

```
terraform init
terraform fmt
terraform validate
terraform plan --var-file ../terraform.tfvars
terraform apply --var-file ../terraform.tfvars
```

リソース削除の場合
```
terraform destroy --var-file ../terraform.tfvars
```
