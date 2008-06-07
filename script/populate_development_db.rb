#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../config/boot'
require File.dirname(__FILE__) + '/../config/environment'

Location.delete_all
Ship.delete_all
Item.delete_all
Manifest.delete_all

Location.create :name => "Star Base Alpha"

('A'..'D').each do |l|
   Location.create :name => ( "Astroid " + l )
end

Ship.create :location => Location.find(:first), :name => "Infinity"
Ship.create :location => Location.find(:first), :name => "Agamemnon"
Ship.create :location => Location.find(:first), :name => "Enterpriseee"
Ship.create :location => Location.find(:first), :name => "Soler Brease"

Item.create :name => "Veldspar ore"
Item.create :name => "Scordite ore"
Item.create :name => "Pyroxeres ore"
Item.create :name => "Plagioclase ore"

Manifest.create :item => 1, :ship => 1 :number => 1
