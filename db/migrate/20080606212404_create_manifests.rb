class CreateManifests < ActiveRecord::Migration
  def self.up
    create_table :manifests do |t|
	t.integer :ship_id,	:null => false
	t.integer :item_id,	:null => false
	t.integer :number,	:default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :manifests
  end
end
