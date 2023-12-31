# RailsScrapingApp
このアプリケーションはボランティア募集サイトの募集をスクレイピングしてまとめて表示するアプリケーションです。

自己学習の為に作成しているものです。

いくつかのボランティアサイトに対応しており、順次追加予定です。

## 起動方法
Railsのサーバーを起動してください

rails server

## ActiveJob
スクレイピングなどはコンソール上で起動するアプリケーションとなっています。

### コンソールを起動

rails console

### CrawlAndParseJob（クロール機能＆パース機能）

CrawlAndParseJob.perform_now

### RegisterOrganizationJob（募集団体登録機能）

RegisterOrganizationJob.perform_now

### AssociateJob（募集団体登録機能）

AssociateJob.perform_now

## 開発をする場合
開発をする場合は、サーバーと一緒に以下の2つも起動をしてください。

### Reactコンパイル
shakapackerを使用しているので、サーバーと一緒に起動してください

./bin/shakapacker-dev-server

### sassのコンパイル
sassはdartsassを採用している為以下のコマンドでコンパイルをしてください。

rails dartsass:watch
