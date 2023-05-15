# 環境変数

## deploy

### 開発版

`firebase deploy --only functions --project anaba-dev`

### 本番版

`firebase deploy --only functions --project anaba-prod`

## 環境変数の設定

### 開発版

`firebase --project anaba-dev functions:config:set secret.key=value`

### 本番版

`firebase --project anaba-prod functions:config:set secret.key=value`

## どんな変数が set されているか確認したい

### 開発版

`firebase --project anaba-dev functions:config:get`

### 本番版

`firebase --project anaba-prod functions:config:get`

## TS での環境変数の読み込み

`functions.config().secret.key`
