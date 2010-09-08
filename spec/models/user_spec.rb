require 'spec_helper'

describe User do
	it "should not have any created" do
		User.all.count.should == 0
	end
	it "should have all permissions during development" do
		g = User.new
		g.can('').should == true
	end	
	it "should have one user after creating a user" do
		User.new
		User.all.count.should == 1
	end
	it "should yield the user when accessed" do
		u = User.new
		u = User.all[0]
		u.class.should == "User"
	end
	it "should have the same info we set in the factory" do
		#create a user
		u = User.new
		u = User.all[0]
		u.email.should == "email@pittco.org"
	end
	it "should fail to create the user with a bad email" do
		u = User.new #set the email to be something failure
		u.save!.should == false
	end
	it "should have one user after destroying a user" do
		#create a user
		u = User.new
		User.all.count.should == 1
		u.destroy
		User.all.count.should == 0
	end
end
