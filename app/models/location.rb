class Location < ActiveRecord::Base
	has_many :ships
end

class SpaceStation < Location
end

class Astroid < Location
end
