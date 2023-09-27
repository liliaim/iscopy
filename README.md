# README

## iscopy 旅の計画と記録の管理アプリ

![iscopy 旅を管理するアプリ - Google Chrome 2023_09_27 12_42_24](https://github.com/liliaim/iscopy/assets/139183818/e211d4e8-885c-4054-aa05-78bddebc000c)

旅行の計画や記録を視覚的に管理できるアプリが欲しいと思い作成しました。
いつか訪れる時のために行きたいスポットを貯めておくような使い方も可能です。

- 旅行の計画と記録をマイページの svg の日本地図で視覚的に確認できます。<br >
- 行きたいスポットを位置情報付きで保存できます。 <br >

# URL

https://iscopy.onrender.com/ <br >

認証 ID とパスワードは職務経歴書に記載しております。
認証後、画面中央のログインボタンから、テスト用アカウントを使用してマイページへログインしてください。

## テスト用アカウント

テスト用（サンプルデータ登録済。不定期にリセット実施）

- メールアドレス: test@test.com
- パスワード: 111aaa

- Web ブラウザ Google Chrome の最新版を利用してアクセスしてください。
- デプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
- 接続先およびログイン情報については、上記の通りです。
- 同時に複数の方がログインしている場合に、ログインできない可能性があります。

- 各種画面の閲覧、データ登録操作を試して頂けます。
- 確認後、ログアウト処理をお願いします。

# 機能一覧

- ユーザー登録、ログイン機能(devise)
- 計画投稿機能
  ![iscopy 旅を管理するアプリ - Google Chrome 2023_09_27 12_43_58](https://github.com/liliaim/iscopy/assets/139183818/9816a7a8-0380-4847-a106-976c7315106c)
- 記録投稿機能
  ![iscopy 旅を管理するアプリ - Google Chrome 2023_09_27 12_44_07](https://github.com/liliaim/iscopy/assets/139183818/5107f640-bddc-4755-903d-76cafc03d3ab)
- マイページ機能（地図からのリンク、計画一覧、記録一覧、ページネーション）
  ![iscopy 旅を管理するアプリ - Google Chrome 2023_09_27 12_43_07](https://github.com/liliaim/iscopy/assets/139183818/cd661915-6b97-43b5-bd83-fd79c8a2a364)
- 都道府県ページ（都道府県ごとの計画・記録・スポット）
  ![localhost_3000_prefectures_1](https://github.com/liliaim/iscopy/assets/139183818/1fb5a13a-a955-4d48-9ac5-b664eff570a2)
- スポット登録機能(geocoder による位置情報検索、画像投稿)
  ![localhost_3000_spots_new 1](https://github.com/liliaim/iscopy/assets/139183818/ba861d7b-b2ff-4967-9218-92e8691b3868)

# 使用技術

## フロントエンド

- HTML
- CSS
- Google Maps API
- Bootstrap 5.2.3
- StartBootstrap
- FontAwesome
- kaminari

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
- UptimeReboot

### Github リポジトリ

https://github.com/liliaim/iscopy

# テスト

- RSpec
  - 単体テスト(model)

# 追加実装予定機能

- 全国の登録スポット一覧
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

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| destination   | string     | null: false                    |
| text          | text       | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     |                                |
| start_date    | date       |                                |
| end_date      | date       |                                |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :record

## records テーブル

###旅は 2 種類ある。計画した旅と計画なしの旅。計画が合ってもなくても良いが、計画がある場合は plans と紐づけたい。

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| destination   | string     | null: false                    |
| text          | text       | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     |                                |
| start_date    | date       |                                |
| end_date      | date       |                                |
| plan          | references | foreign_key: true              |
| user          | references | null: false, foreign_key: true |

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
