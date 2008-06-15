class Ship < ActiveRecord::Base
	belongs_to :location
	has_many :manifests

	def warp_to location
		raise WarpToException if location == self.location
		reducte_manifest_by_name "Fuel", 10
		self.location = location
		save
	end

	def reducte_manifest_by_name name_of_item, number
		item = find_item item_by_name name_of_item
		raise OutOfFuel if item.number - number < 0 
		item.number -= number
		item.save!
	end

	def fuel
		number_of_item_by_name "Fuel"
	end

	def number_of_item_by_name name_of_item	
		number_of_item(item_by_name( name_of_item) )
	end

	def number_of_item item
		manifest_item = ( (find_item item) || ( Manifest.new :item => item, :ship => self) )
		manifest_item.number
	end
		
	def item_by_name name_of_item
		Item.find_by_name name_of_item
	end

	def find_item item
		manifests.detect {|m| m.item == item }
	end

	def nearby_ships
	   location.nil? ? [] : location.ships.reject { |s| s == self }
	end

	def send_message(msg)
	   #Message.create! :ship => self, :msg => msg
	end

	def destroy
	   nearby_ships.each { |s| s.send_message "The #{name} explodes!" }
	   super
	end

	class OutOfFuel < Exception
	end

	class WarpToException < Exception
	end

end
