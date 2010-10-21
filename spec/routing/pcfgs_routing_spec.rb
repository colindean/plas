require "spec_helper"

describe PcfgsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/pcfgs" }.should route_to(:controller => "pcfgs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/pcfgs/new" }.should route_to(:controller => "pcfgs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/pcfgs/1" }.should route_to(:controller => "pcfgs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/pcfgs/1/edit" }.should route_to(:controller => "pcfgs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/pcfgs" }.should route_to(:controller => "pcfgs", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/pcfgs/1" }.should route_to(:controller => "pcfgs", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/pcfgs/1" }.should route_to(:controller => "pcfgs", :action => "destroy", :id => "1")
    end

  end
end
