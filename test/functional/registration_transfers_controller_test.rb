require 'test_helper'

class RegistrationTransfersControllerTest < ActionController::TestCase

  tests RegistrationTransfersController

  def setup
    @registration_transfer = Factory(:registration_transfer)
  end

  # def test_should_get_index
    # get :index
    # assert_response :success
    # assert assigns(:registration_transfers)
  # end

  # test "should get new" do
    # get :new
    # assert_response :success
  # end

  # test "should create registration_transfer" do
    # assert_difference('RegistrationTransfer.count') do
      # post :create, :registration_transfer => @registration_transfer.attributes
    # end

    # assert_redirected_to registration_transfer_path(assigns(:registration_transfer))
  # end

  # test "should show registration_transfer" do
    # get :show, :id => @registration_transfer.to_param
    # assert_response :success
  # end

end

