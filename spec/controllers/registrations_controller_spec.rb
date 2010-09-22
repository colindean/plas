require 'spec_helper'

describe RegistrationsController do

  def mock_registration(stubs={})
    @mock_registration ||= mock_model(Registration, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all registrations as @registrations" do
      Registration.stub(:all) { [mock_registration] }
      get :index
      assigns(:registrations).should eq([mock_registration])
    end
  end

  describe "GET show" do
    it "assigns the requested registration as @registration" do
      Registration.stub(:find).with("37") { mock_registration }
      get :show, :id => "37"
      assigns(:registration).should be(mock_registration)
    end
  end

  describe "GET new" do
    it "assigns a new registration as @registration" do
      Registration.stub(:new) { mock_registration }
      get :new
      assigns(:registration).should be(mock_registration)
    end
  end

  describe "GET edit" do
    it "assigns the requested registration as @registration" do
      Registration.stub(:find).with("37") { mock_registration }
      get :edit, :id => "37"
      assigns(:registration).should be(mock_registration)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created registration as @registration" do
        Registration.stub(:new).with({'these' => 'params'}) { mock_registration(:save => true) }
        post :create, :registration => {'these' => 'params'}
        assigns(:registration).should be(mock_registration)
      end

      it "redirects to the created registration" do
        Registration.stub(:new) { mock_registration(:save => true) }
        post :create, :registration => {}
        response.should redirect_to(registration_url(mock_registration))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved registration as @registration" do
        Registration.stub(:new).with({'these' => 'params'}) { mock_registration(:save => false) }
        post :create, :registration => {'these' => 'params'}
        assigns(:registration).should be(mock_registration)
      end

      it "re-renders the 'new' template" do
        Registration.stub(:new) { mock_registration(:save => false) }
        post :create, :registration => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested registration" do
        Registration.should_receive(:find).with("37") { mock_registration }
        mock_registration.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :registration => {'these' => 'params'}
      end

      it "assigns the requested registration as @registration" do
        Registration.stub(:find) { mock_registration(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:registration).should be(mock_registration)
      end

      it "redirects to the registration" do
        Registration.stub(:find) { mock_registration(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(registration_url(mock_registration))
      end
    end

    describe "with invalid params" do
      it "assigns the registration as @registration" do
        Registration.stub(:find) { mock_registration(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:registration).should be(mock_registration)
      end

      it "re-renders the 'edit' template" do
        Registration.stub(:find) { mock_registration(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested registration" do
      Registration.should_receive(:find).with("37") { mock_registration }
      mock_registration.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the registrations list" do
      Registration.stub(:find) { mock_registration }
      delete :destroy, :id => "1"
      response.should redirect_to(registrations_url)
    end
  end

end
