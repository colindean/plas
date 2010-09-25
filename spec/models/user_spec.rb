require 'spec_helper'

describe User do
  
  before(:each) do
    @attributes = {
      :given_name => 'Robert',
      :family_name => 'Sample',
      :email => 'email@pittco.org',
      :password => '123Password'
    }
  end

  it "should not have any created" do
    User.all.count.should == 0
  end

  it "should have all permissions during development" do
    g = User.new
    g.can('').should be_true
  end 

  it "should have one user after creating a user" do
    User.create @attributes
    User.all.count.should == 1
  end

  it "should yield the user when accessed" do
    u = User.create @attributes
    u = User.all[0]
    u.class.should == User
  end

  it "should have the same info we set in the attributes" do
    u = User.create @attributes
    u = User.all[0]
    u.email.should == "email@pittco.org"
  end

  it "should fail to create the user with a bad email" do
    u = User.new @attributes
    u.email = 'x'
    u.should_not be_valid
  end

  it "should have one user after destroying a user" do
    u = User.create @attributes
    User.all.count.should == 1
    u.destroy
    User.all.count.should == 0
  end

end
