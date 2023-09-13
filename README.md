
# README 
## iscopy 地図を見てわかる旅の計画と記録の管理アプリ
 
初めて作るオリジナルアプリは自分が欲しいものを作りました。
お気に入りのお店をブックマーク出来るようなアプリは沢山あるのですが、
自分が旅行の計画や記録を全て視覚的に管理できるアプリが欲しいと思っていました。

テレビやネットで見聞きしたり、知り合いから良かった旅先を紹介されても
日々の生活の中であの場所はどこだっけと忘れていってしまうことが多いです。
このアプリはいつか訪れる時のために行きたい場所を貯めておくためのアプリでもあります。

   - 旅行の計画と記録をマイページのsvgの日本地図で視覚的に確認できます。<br >
   - 行きたいスポットを位置情報付きで保存できます。 <br >


# URL
https://iscopy.onrender.com/ <br >

画面中央のログインボタンから、メールアドレスとパスワードを入力してログインください。


## テスト用アカウント
テスト用（サンプルデータ登録済。不定期にリセット実施）
  - メールアドレス: test1@test.com
  - パスワード: 111aaa

  - WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
  - デプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
  - 接続先およびログイン情報については、上記の通りです。
  - 同時に複数の方がログインしている場合に、ログインできない可能性があります。
  - テストアカウントでログイン→トップページからマイページ押下→商品情報入力→商品出品
  - 確認後、ログアウト処理をお願いします。
  - アプリのスリープ解除のため、30秒程度の応答遅延が発生する可能性がございます。


# 使用技術
## フロントエンド
- HTML
- CSS
- Google Maps API
- Bootstrap 5.2.3
- StartBootstrap
- FontAwesome
## バックエンド
- Ruby 3.2.0
- Ruby on Rails 7.0.7
- MySQL 5.7.43
- PostgreSQL (psql 14.8)
- Puma
- RSpec
## インフラ
- VSCode(開発環境)

## その他
- Git/GitHub

### Githubリポジトリ
https://github.com/liliaim/iscopy


# 機能一覧
- ユーザー登録、ログイン機能(devise)
- 計画投稿機能
- 記録投稿機能
- スポット登録機能
- 位置情報検索機能(geocoder)


# テスト
- RSpec
  - 単体テスト(model)
  
# 追加実装予定機能
- 画像投稿機能
- スポット検索機能

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :plans
- has_many :records
- has_many :spots


## plans テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| destination     | string     | null: false                    |
| text            | text       | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     |                                |
| start_date      | date       |                                |
| end_date        | date       |                                |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :record


## records テーブル
###旅は2種類ある。計画した旅と計画なしの旅。計画が合ってもなくても良いが、計画がある場合はplansと紐づけたい。

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| destination     | string     | null: false                    |
| text            | text       | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     |                                |
| start_date      | date       |                                |
| end_date        | date       |                                |
| plan            | references | foreign_key: true              |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :plan, optional:true


## spots テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| icon_id       | integer    | null: false                    |
| spot_name     | string     | null: false                    |
| information   | text       |                                |
| prefecture_id | integer    | null: false                    |
| address       | string     |                                |
| latitude      | decimal    |                                |
| longitude     | decimal    |                                |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user


