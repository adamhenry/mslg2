#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../config/boot'
require File.dirname(__FILE__) + '/../config/environment'

Location.delete_all
Ship.delete_all

Location.create :name => "Star Base Alpha"

('A'..'D').each do |l|
   Location.create :name => ( "Astroid " + l )
end

Ship.create :location => Location.find(:first), :name => "Infinity"
Ship.create :location => Location.find(:first), :name => "Agamemnon"
Ship.create :location => Location.find(:first), :name => "Enterpriseee"
Ship.create :location => Location.find(:first), :name => "Soler Brease"
