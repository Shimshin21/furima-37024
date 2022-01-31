class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string  :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true

      t.integer :category_id, null: false
      t.integer :item_condition_id, null: false
      t.integer :shipping_cost_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :shipping_days_id, null: false

      t.timestamps
    end
  end
end

#| category_id           | integer          | null: false,                   |
#| item_condition_id     | integer          | null: false                    |
#| shipping_cost_id      | integer          | null: false                    |
#| prefecture_id         | integer          | null: false                    |
#| shipping_days_id      | integer          | null: false                    |