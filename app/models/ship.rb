class Ship < ActiveRecord::Base
	belongs_to :location
	has_many :manifests

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

	def assign_role(role)
	end

	def in_role?(role)
		true
	end

end
