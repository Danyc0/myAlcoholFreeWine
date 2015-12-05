class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.string :short_description, null: false
      t.text :long_description, null: false
      t.string :origin, null: false
      t.string :grape, null: false
      t.boolean :vegitarian, null:false
      t.decimal :size, null: false
      t.float :price, null: false

      t.timestamps null: false
    end
  end
end
