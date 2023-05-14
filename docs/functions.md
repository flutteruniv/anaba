# 環境変数

## 環境変数の設定

`firebase functions:config:set secret.key="value"`

## TS での環境変数の読み込み

`functions.config().secret.key`

## どんな変数が set されているか確認したい

`firebase functions:config:get`
