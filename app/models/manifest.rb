class Manifest < ActiveRecord::Base
	belongs_to :ship
	belongs_to :item
end
