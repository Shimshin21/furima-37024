
# README

# DB 設計

## users table
| Column                | Type                | Options                        |
|-----------------------|---------------------|--------------------------------|
| nickname              | string              | null: false                    |
| email                 | string              | null: false, unique: true      |
| encrypted_password    | string              | null: false                    |
| family_name           | string              | null: false                    |
| first_name            | string              | null: false                    |
| family_name_kana      | string              | null: false                    |
| first_name_kana       | string              | null: false                    |
| birth                 | date                | null: false                    |
| shipping address      | references          | null: false, foreign_key: true |

### Association
* has_many :items
* has_many :buyer
* has_one :shipping address


## items table
| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| name               | string              | null: false                    |
| description        | text                | null: false                    |
| photo              | text                | null: false                    |
| price              | integer             | null: false                    |
| user               | references          | null: false, foreign_key: true |
| category           | references          | null: false, foreign_key: true |
| item_condition     | string              | null: false                    |
| shipping_cost      | string              | null: false                    |
| shipping_place     | string              | null: false                    |
| shipping_days      | string              | null: false                    |
| shipping address   | references          | null: false, foreign_key: true |


### Association
* has_one    :buyer
* belongs_to :user
* belongs_to_active_hash :category
* belongs_to_active_hash :item_condition
* belongs_to_active_hash :shipping_cost
* belongs_to_active_hash :prefecture
* belongs_to_active_hash :shipping_days
* has_one :shipping address

# gemファイルに  gem 'active_hash' と入力する


## buyer table
| Column             | Type              | Options                          |
|--------------------|-------------------|----------------------------------|
| family_name        | string            | null: false                      |
| first_name         | string            | null: false                      |
| family_name_kana   | string            | null: false                      |
| first_name_kana    | string            | null: false                      |
| post_code          | string            | null: false                      |
| prefecture         | string            | null: false                      |
| city               | string            | null: false                      |
| address            | string            | null: false                      |
| building_name      | string            | null: false                      |
| tel_number         | string            | null: false                      |
| user               | string            | null: false, foreign_key: true   |
| shipping address   | references        | null: false, foreign_key: true   |

### Association
* has_one :shipping address


## shipping address table
| Column              | Type              | Options                        |
|---------------------|-------------------|--------------------------------|
| users               | references        | null: false, foreign_key: true |
| items               | references        | null: false, foreign_key: true |
| buyer               | references        | null: false, foreign_key: true |
### Association
* belongs_to : buyer
* belongs_to : items
* belongs_to : users




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