require 'spec_helper'

describe User do
	it "should not have any created" do
		User.all.count.should == 0
	end
end
