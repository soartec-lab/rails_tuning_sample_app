# README

## Introduction
N+1対策の知識は高負荷railsアプリケーション開発に必須のスキルです。
市場のrails案件は高負荷(急成長サービス、大規模サービス、高トラフィックサービス)も多く、また、今は小規模でも急成長する可能性もあります。

高トラフィックサービスの運用には、スケーラビリティ性が必須です。
N+1とはデータと計算量が比例して増えてしまう状態。つまり、スケーラビリティ性が低い状態なので高トラフィックを捌けない、または将来捌けなくなるコードという状態です。

スケーラビリティ性はインフラもアプリケーションアーキテクチャもコーディングテクニックも必要です。
アプリケーションのN+1対策の知識はコーディングテクニックの話に該当します。

railアプリケーションで高負荷システム開発に現在携わっている、携わりたい、これから携わる人の為に
ページ表示に5秒以上かかっているページに以下の3つのメソッドを正しく使い、0.4秒までパフォーマンスチューニングするリポジトリを作成しました。

* joins
* preload
* eager_load 

## Middleware versions

| middleware | version |
|---|---|
| Ruby | 2.3.0p0 |
| Rails | 6.1.0 |
| node.js | v12.16.2 |
| yarn| 1.22.4 |

## Degign

<img width="1434" alt="スクリーンショット 2020-05-01 0 25 50" src="https://user-images.githubusercontent.com/18366969/80728952-82fde080-8b42-11ea-907b-1c71e124866f.png">

## ER diagram
<img width="1434" alt="ER diagram" src="https://user-images.githubusercontent.com/18366969/80870837-ea9f6180-8ce3-11ea-92a0-967407d97af8.png">

## branch

| branch | 役割 | ページ描画速度 |
|---|---|---|
| master | チューニング前 | 5000ms以上 |
| master_tuning | チューニング後 | 400ms以下 |
| use_bullet | gem 'bullet'のサンプル | 400ms以下 |

## Setup

```
$ git clone https://github.com/soartec-lab/rails_tuning_sample_app.git
$ cd rails_tuning_sample_app
$ bundle install
$ yarn
$ rails db:create
$ rails db:migrate
$ rails db:seed
$ rails s
```
