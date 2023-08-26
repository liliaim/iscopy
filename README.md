# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
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
| start_date      | date       | null: false                    |
| end_date        | date       | null: false                    |
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
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user

