class Manifest < ActiveRecord::Base
	belongs_to :ship
	belongs_to :item

	def add number
		self.number += number
	end

	def add! number
		self.add number
		self.save
	end

	def duplicate_manifest
		ship.manifests.detect { |m| m.item == item }
	end

	def merge(old)
		self.created_at = old.created_at
		add old.number
		old.destroy
	end

	def before_save
		#merge(duplicate_manifest) if duplicate_manifest
	end
end
