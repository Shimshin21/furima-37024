
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

### Association
* has_many :items
* has_many :buyers

## items table
| Column             | Type                | Options                        |
|-----------------------|------------------|--------------------------------|
| name                  | string           | null: false                    |
| description           | text             | null: false                    |
| price                 | integer          | null: false                    |
| user                  | references       | null: false, foreign_key: true |
| category_id           | integer          | null: false,                   |
| item_condition_id     | integer          | null: false                    |
| shipping_cost_id      | integer          | null: false                    |
| prefecture_id         | integer          | null: false                    |
| shipping_days_id      | integer          | null: false                    |

### Association
* has_one    :shipping_address
* belongs_to :user
* belongs_to_active_hash :category
* belongs_to_active_hash :item_condition
* belongs_to_active_hash :shipping_cost
* belongs_to_active_hash :prefecture
* belongs_to_active_hash :shipping_days


## buyers table
| Column             | Type              | Options                          |
|--------------------|-------------------|----------------------------------|
| post_code          | string            | null: false                      |
| prefecture_id      | integer           | null: false                      |
| city               | string            | null: false                      |
| address            | string            | null: false                      |
| building_name      | string            |                                  |
| tell_number        | string            | null: false                      |
| shipping address   | references        | null: false, foreign_key: true   |

### Association
* belongs_to :shipping_address


## shipping addresses table
| Column             | Type              | Options                        |
|--------------------|-------------------|--------------------------------|
| user               | references        | null: false, foreign_key: true |
| item               | references        | null: false, foreign_key: true |

### Association
* belongs_to : item
* belongs_to : user
* has_one    : buyer

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