# テーブル設計

## usersテーブル

| column             | Type   | Options              |
| ------------------ | ------ | -------------------- |
| email              | string | NOT NULL, ユニーク制約 |
| encrypted_password | string | NOT NULL             |
| name               | string | NOT NULL             |
| profile            | text   | NOT NULL             |
| occupation         | text   | NOT NULL             |
| position           | text   | NOT NULL             |

### Association
- has_many :prototypes
- has_many :comments

## prototypesテーブル

| column     | Type       | Options           |
| ---------- | ---------  | ----------------- |
| title      | string     | NOT NULL          |
| catch_copy | text       | NOT NULL          |
| concept    | text       | NOT NULL          |
| user       | references | NOT NULL, 外部キー |

### Association
-has_many :comments
-belongs_to :users 

## commentsテーブル
| column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| content   | text       | NOT NULL          |
| prototype | references | NOT NULL, 外部キー |
| user      | references | NOT NULL, 外部キー |

### Association
- belongs_to :users
- belongs_to :prototypes