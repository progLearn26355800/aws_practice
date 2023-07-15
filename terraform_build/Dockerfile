FROM python:latest


# 前提となるパッケージのインストール
RUN apt-get update && apt-get install -y vim wget unzip sudo

ARG version="1.4.6"

# Terraformインストール (執筆時点での最新版を導入してます。バージョン一覧 => https://releases.hashicorp.com/terraform/)
RUN wget https://releases.hashicorp.com/terraform/${version}/terraform_${version}_linux_amd64.zip \
    && unzip ./terraform_${version}_linux_amd64.zip -d /usr/local/bin/ \
    && rm ./terraform_${version}_linux_amd64.zip

