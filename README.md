# README

# DB 設計

## users table
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birth_year         | integer             | null: false               |
| birth_month        | integer             | null: false               |
| birth_day          | integer             | null: false               |

### Association
* has_many :item
* has_one  :buyer
* has_one  :credit_card


## items table
| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| item_name          | string              | null: false                    |
| description        | text                | null: false                    |
| item_status        | string              | null: false                    |
| shipping_cost      | string              | null: false                    |
| shipping_source    | string              | null: false                    |
| shipping_days      | string              | null: false                    |
| price              | integer             | null: false                    |
| user               | references          | null: false, foreign_key: true |
| category           | references          | null: false, foreign_key: true |
| shipping           | references          | null: false, foreign_key: true |
| brand              | references          | null: false, foreign_key: true |

### Association
* has_many :item_image
* belongs_to :user
* belongs_to :brand
* belongs_to :category


## item_image table
| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| item        | references | null: false, foreign_key: true |

### Association
* belongs_to :items


## category table
| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| name        | string     | null: false                    |
| item        | references | null: false, foreign_key: true |

### Association
* belongs_to :items


## brand table
| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| name        | string     | null: false                    |

### Association
* belongs_to :items

## credit_card table
| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |
| custmer     | string     | null: false, foreign_key: true |
| card        | integer    | null: false                    |

### Association
* belongs_to :users

## buyer table
| Column             | Type              | Options                        |
|--------------------|-------------------|--------------------------------|
| family_name        | string            | null: false                    |
| first_name         | string            | null: false                    |
| family_name_kana   | string            | null: false                    |
| first_name_kana    | string            | null: false                    |
| post_code          | string            | null: false                    |
| prefecture         | string            | null: false                    |
| city               | string            | null: false                    |
| address            | string            | null: false                    |
| building_name      | string            | null: false                    |
| tel_number         | string            | null: false                    |
| user               | string            | null: false, foreign_key: true |

### Association
* belongs_to :users





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

## prototypes table



### Association

- belongs_to :user
- has_many :comments

## comments table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| content     | text       | null: false                    |
| prototype   | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :prototype
- belongs_to :user