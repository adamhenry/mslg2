class Manifest < ActiveRecord::Base
	belongs_to :ship
	belongs_to :item

	def duplicate_manifest
		ship.manifests.detect { |m| m.item = item }
	end

	def merge(old)
		self.created_at = old.created_at
		self.number += old.number
		old.destroy
	end

	def before_save
		merge(duplicate_manifest) if duplicate_manifest
	end
end
