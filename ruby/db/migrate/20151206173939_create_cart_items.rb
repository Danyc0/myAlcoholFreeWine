class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
        t.shopping_cart_item_fields
    end
  end
end
