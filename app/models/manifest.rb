class Manifest < ActiveRecord::Base
	belongs_to :ship
	belongs_to :item

	def to_i
		number
	end

	def add_to manifest
		manifest.number += self.number
		manifest.save
	end

	def duplicate_manifest
		ship.manifests.detect { |m| m.item == item }
	end

	def merge(old)
		add_to old
		destroy
	end

	def set_number(amount)
		raise Ship::OutOfStockError if amount < 0
		if amount == 0
			destroy
		else
			update_attributes! :number => amount
		end
	end

	def before_create
		#merge(duplicate_manifest) if duplicate_manifest
	end
end
