class AddAssumptions < ActiveRecord::Migration
  def self.up
    create_table :assumptions do |t|
      t.string :value
      t.timestamps
    end
    
    create_table :validations do |t|
      t.integer :assumption_id
      t.integer :startup_id
      t.boolean :confirms
      t.text :how
    end
    
  end

  def self.down
    drop_table :validations
    drop_table :assumptions
    
  end
end
