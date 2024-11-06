# TerraformによるGoogle Cloud Runへのデプロイ

## Google Cloud CLIのインストール

まず、Google Cloud CLI(gcloud)をインストールします。

```bash
# 1. パッケージリポジトリの設定と必要なパッケージのインストール
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates gnupg curl sudo

# 2. Google Cloudの公開鍵を追加
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

# 3. Google Cloudのパッケージリポジトリを追加
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# 4. パッケージリストを更新してGoogle Cloud CLIをインストール
sudo apt-get update
sudo apt-get install google-cloud-cli
```

## Google Cloud CLIの初期化

Google Cloud CLIを初期化し、プロジェクトとアカウントに認証します。

```bash
# Google Cloud CLIの初期化
gcloud init

# アプリケーションデフォルト認証情報の設定
gcloud auth application-default login
```

## Terraformによるインフラ構築

Terraformを使用し、Google CLoudのリソースを構築します。

```bash
cd terraform
# Terraformの初期化
terraform init
# Terraformの実行計画を確認
terraform plan
# Terraformの実行
terraform apply -auto-approve
```

## Google Artifact Registryの設定

Artifact Registryにコンテナをプッシュできるようにするため、Dockerの認証を設定します。

```bash
# 認証情報を設定
gcloud auth configure-docker asia-northeast1-docker.pkg.dev
```

## コンテナのビルドとプッシュ

コンテナをビルドし、Artifact Registryにプッシュします。

```bash
# コンテナのビルド
docker build -t [region]-docker.pkg.dev/[project_id]/[repository_id]/[service_name] .
# コンテナのプッシュ
docker push [region]-docker.pkg.dev/[project_id]/[repository_id]/[service_name]
```

# 後片付け

Terraformによるインフラ構築を削除します。

```bash
terraform destroy -auto-approve
```
