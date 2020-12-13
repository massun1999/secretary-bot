# Messaging APIを用いたLINEの大喜利Bot

## アプリケーションの概要
友人からの希望でユーザーが何かメッセージを送信すると大喜利のお題を振ってくるというLINEのチャットボットを作成しました。
お題に対して、【回答】　とつけてメッセージを送信すると褒めてもらえます。
10:00, 12:00, 20:00にはBot側からメッセージが送信される機能も実装されています。
ぜひ遊んでみてください。

## 開発環境

Ruby2.6.5/Ruby on Rails6.0.3.4/Mysql/git hub/Sequel Pro/Messaging API

## 実装した機能

- 応答メッセージ
- プッシュメッセージ
− 友達追加イベントでusersテーブルにLINEのユーザーIDが保存
- ローカル環境でのテストを行うためngrok導入
- wheneverを使った指定した時間のタスク起動（デプロイはherokuで行っているため本番環境ではwheneverは使っていません）

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
