require 'spec_helper'

describe PcfgsController do

  def mock_pcfg(stubs={})
    (@mock_pcfg ||= mock_model(Pcfg).as_null_object).tap do |pcfg|
      pcfg.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all pcfgs as @pcfgs" do
      Pcfg.stub(:all) { [mock_pcfg] }
      get :index
      assigns(:pcfgs).should eq([mock_pcfg])
    end
  end

  describe "GET show" do
    it "assigns the requested pcfg as @pcfg" do
      Pcfg.stub(:find).with("37") { mock_pcfg }
      get :show, :id => "37"
      assigns(:pcfg).should be(mock_pcfg)
    end
  end

  describe "GET new" do
    it "assigns a new pcfg as @pcfg" do
      Pcfg.stub(:new) { mock_pcfg }
      get :new
      assigns(:pcfg).should be(mock_pcfg)
    end
  end

  describe "GET edit" do
    it "assigns the requested pcfg as @pcfg" do
      Pcfg.stub(:find).with("37") { mock_pcfg }
      get :edit, :id => "37"
      assigns(:pcfg).should be(mock_pcfg)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created pcfg as @pcfg" do
        Pcfg.stub(:new).with({'these' => 'params'}) { mock_pcfg(:save => true) }
        post :create, :pcfg => {'these' => 'params'}
        assigns(:pcfg).should be(mock_pcfg)
      end

      it "redirects to the created pcfg" do
        Pcfg.stub(:new) { mock_pcfg(:save => true) }
        post :create, :pcfg => {}
        response.should redirect_to(pcfg_url(mock_pcfg))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pcfg as @pcfg" do
        Pcfg.stub(:new).with({'these' => 'params'}) { mock_pcfg(:save => false) }
        post :create, :pcfg => {'these' => 'params'}
        assigns(:pcfg).should be(mock_pcfg)
      end

      it "re-renders the 'new' template" do
        Pcfg.stub(:new) { mock_pcfg(:save => false) }
        post :create, :pcfg => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested pcfg" do
        Pcfg.should_receive(:find).with("37") { mock_pcfg }
        mock_pcfg.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :pcfg => {'these' => 'params'}
      end

      it "assigns the requested pcfg as @pcfg" do
        Pcfg.stub(:find) { mock_pcfg(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:pcfg).should be(mock_pcfg)
      end

      it "redirects to the pcfg" do
        Pcfg.stub(:find) { mock_pcfg(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(pcfg_url(mock_pcfg))
      end
    end

    describe "with invalid params" do
      it "assigns the pcfg as @pcfg" do
        Pcfg.stub(:find) { mock_pcfg(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:pcfg).should be(mock_pcfg)
      end

      it "re-renders the 'edit' template" do
        Pcfg.stub(:find) { mock_pcfg(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested pcfg" do
      Pcfg.should_receive(:find).with("37") { mock_pcfg }
      mock_pcfg.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the pcfgs list" do
      Pcfg.stub(:find) { mock_pcfg }
      delete :destroy, :id => "1"
      response.should redirect_to(pcfgs_url)
    end
  end

end
