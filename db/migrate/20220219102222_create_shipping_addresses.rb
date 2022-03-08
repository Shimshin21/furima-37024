class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|

      t.references :item, foreign_key: true, null:false
      t.references :user, foreign_key: true, null:false

      t.timestamps
    end
  end
end
