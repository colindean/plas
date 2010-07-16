class AddressesController < ApplicationController
	def create
		@user = User.find(params[:user_id])
		@address = @user.addresses.create(params[:address])
		redirect_to user_path(@user)
	end
end
