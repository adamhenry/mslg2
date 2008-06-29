class Ship < ActiveRecord::Base
	belongs_to :location
	has_many :manifests do
		def [](item)
			find_by_item_id(item.id).to_i
		end

		def []=(item,amount)
			find_or_create_by_item(item).set_number(amount)
			reload
		end

		def find_or_create_by_item(item)
			find_by_item_id(item.id) or Manifest.create!(:item => item, :ship => @owner)
		end


	end

	class OutOfFuel < Exception; end
	class OutOfStock < Exception; end
	class WarpToException < Exception; end
	class NoItemError < Exception; end

	@fuel = Item.find_by_name("Fuel")

	def warp_to location
		raise WarpToException if location == self.location
		burn_fuel 10
		self.location = location
		save!
	end

	def burn_fuel(amount)
		begin
			manifests[@fuel] -= amount
		rescue NoItemError
			raise OutOfFuel
		end
	end

	def fuel_type
		Item.find_by_name "Fuel" || raise NoFuleTypeItemForShipError
	end

	def find_item item
		raise NoItemError unless manifests.detect {|m| m.item == item }
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

end
