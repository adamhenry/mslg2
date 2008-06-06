class CreateShips < ActiveRecord::Migration
  def self.up
    create_table :ships do |t|
	t.string :name
	t.integer :max_cargo_space, :default => 300
	t.integer :location_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ships
  end
end
