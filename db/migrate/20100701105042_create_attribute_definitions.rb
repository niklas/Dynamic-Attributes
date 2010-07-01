class CreateAttributeDefinitions < ActiveRecord::Migration
  def self.up
    create_table :attribute_definitions do |t|
      t.string :name
      t.string :data_type
      t.integer :classification_id

      t.timestamps
    end
  end

  def self.down
    drop_table :attribute_definitions
  end
end
