require 'spec_helper'

describe User do
	it "should not have any created" do
		User.all.count.should == 0
	end
	it "should have all permissions during development" do
		g = User.new
		g.can('').should == true
	end	
end
