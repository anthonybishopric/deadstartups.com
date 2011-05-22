class AddStartupsAndTags < ActiveRecord::Migration
  def self.up
    create_table :startups do |t|
      t.string :name
      t.string :website
      t.text :reason
      t.datetime :born
      t.datetime :died
      t.timestamps
    end
    
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
    
    create_table :startups_tags, :id => false do |t|
      t.integer :startup_id
      t.integer :tag_id
    end
  end

  def self.down
    drop_table :startups_tags
    drop_table :tags
    drop_table :startups
    
  end
end
