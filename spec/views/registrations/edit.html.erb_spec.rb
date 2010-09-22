require 'spec_helper'

describe "registrations/edit.html.erb" do
  before(:each) do
    @registration = assign(:registration, stub_model(Registration,
      :new_record? => false,
      :ticket => nil,
      :price_paid => "",
      :purchaser => nil,
      :user => nil,
      :package_parent => nil,
      :checked_in => false
    ))
  end

  it "renders the edit registration form" do
    render

    rendered.should have_selector("form", :action => registration_path(@registration), :method => "post") do |form|
      form.should have_selector("input#registration_ticket", :name => "registration[ticket]")
      form.should have_selector("input#registration_price_paid", :name => "registration[price_paid]")
      form.should have_selector("input#registration_purchaser", :name => "registration[purchaser]")
      form.should have_selector("input#registration_user", :name => "registration[user]")
      form.should have_selector("input#registration_package_parent", :name => "registration[package_parent]")
      form.should have_selector("input#registration_checked_in", :name => "registration[checked_in]")
    end
  end
end
