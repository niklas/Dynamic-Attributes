class CreateProductAttributes < ActiveRecord::Migration
  def self.up
    create_table :product_attributes do |t|
      t.integer :product_id
      t.integer :attribute_definition_id
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :product_attributes
  end
end
