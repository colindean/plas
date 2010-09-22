require "spec_helper"

describe RegistrationsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/registrations" }.should route_to(:controller => "registrations", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/registrations/new" }.should route_to(:controller => "registrations", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/registrations/1" }.should route_to(:controller => "registrations", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/registrations/1/edit" }.should route_to(:controller => "registrations", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/registrations" }.should route_to(:controller => "registrations", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/registrations/1" }.should route_to(:controller => "registrations", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/registrations/1" }.should route_to(:controller => "registrations", :action => "destroy", :id => "1")
    end

  end
end
