require File.join(File.dirname(__FILE__), "../spec_helper" )

describe Ship  do
	context "warping" do
		before do
			@location = Location.new :name => "B"
			@ship = Ship.new :name => "I", :location => @location
		end

		it "raises an exeption if you try to warp to it's current loation." do
			lambda { @ship.warp_to @ship.location}.should raise_error
		end

		it "burns 10 fuel" do
			@ship.should_receive(:burn_fuel).with(10)
			@ship.stub! :save!
			@ship.warp_to Location.new 
		end

		it "moves you to the location" do
			new_location = Location.new
			@ship.stub! :burn_fuel
			@ship.stub! :save!
			@ship.should_receive(:location=).with(new_location)
			@ship.warp_to new_location
		end

	end

	context "reduce manifest by name" do
		before do
			@ship = Ship.new
		end
	end

	context "general" do
		before do
			@ship = Ship.new
			@item = Item.new :name => "new item"
		end
		it "burns fuel" do
			@ship.should_receive(:reduce_manifest_by_name).with("Fuel",10)
			@ship.burn_fuel 10
		end
		it "locates and item in Items" do
			@ship.item_by_name "new item"
		end
	end

	context "manifests" do
		before do
			@item = Item.create! :name => "test item"
			@ship = Ship.create! :name => "test ship"
		end

		it "can access item number through []" do
			@ship.manifests << Manifest.new(:item => @item, :number => 5)
			@ship.manifests[@item].should == 5
		end

		it "can create a manifest through []=" do
			@ship.manifests[@item] = 6
			@ship.manifests.detect { |i| i.item == @item }.number.should == 6
		end

		it "can modify to a manifest through [] and []=" do
			@ship.manifests[@item] = 6
			@ship.manifests[@item] += 1 
			@ship.manifests.detect { |i| i.item == @item }.number.should == 7
		end

		it "can delete a manifest through []= 0 " do
			@ship.manifests[@item] = 0
			@ship.manifests.detect { |i| i.item == @item }.should == nil
		end

		it "should show a value of zero for any non existent manifests" do
			@ship.manifests[@item].should == 0
		end
	end

end
# Problems
#     continued copyiing of fuel in hard code makeing it to harded to chage leater
