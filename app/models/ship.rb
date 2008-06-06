class Ship < ActiveRecord::Base
	belongs_to :location

	def nearby_ships
	   location.ships.reject { |s| s == self } 
	end

	def send_message(msg)
	   Message.create! :ship => self, :msg => msg
	end

	def destroy
	   nearby_ships.each { |s| s.send_message "The #{name} explodes!" }
	   super
	end

end
