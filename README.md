# Messaging APIを用いたLINEの大喜利Bot

## 開発環境

Ruby2.6.5/Ruby on Rails6.0.3.4/Mysql/git hub/Sequel Pro/Messaging API

## 実装した機能

・応答メッセージ
・プッシュメッセージ
・ローカル環境でのテストを行うためngrok導入
・wheneverを使った指定した時間のタスク起動（デプロイはherokuで行っているため本番環境ではwheneverは使っていません）

## テーブル設計

### Usersテーブル

| Column  | Type   | Option |
|---------|--------|--------|
| user_id | string |        |

### Postsテーブル

| Column  | Type   | Option |
|---------|--------|--------|
| name    | string |        |

### repriesテーブル

| Column  | Type   | Option |
|---------|--------|--------|
| text    | string |        |
