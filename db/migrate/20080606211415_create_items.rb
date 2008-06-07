class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
	t.string  :name,	:null => false
	t.integer :volumn,	:default => 1, :null => false
	t.integer :mass,	:default => 1, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
