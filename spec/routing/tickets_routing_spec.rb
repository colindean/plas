require "spec_helper"

describe TicketsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/tickets" }.should route_to(:controller => "tickets", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/tickets/new" }.should route_to(:controller => "tickets", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/tickets/1" }.should route_to(:controller => "tickets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/tickets/1/edit" }.should route_to(:controller => "tickets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/tickets" }.should route_to(:controller => "tickets", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/tickets/1" }.should route_to(:controller => "tickets", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/tickets/1" }.should route_to(:controller => "tickets", :action => "destroy", :id => "1")
    end

  end
end
