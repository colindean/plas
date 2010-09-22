require 'spec_helper'

describe "registrations/show.html.erb" do
  before(:each) do
    @registration = assign(:registration, stub_model(Registration,
      :ticket => nil,
      :price_paid => "",
      :purchaser => nil,
      :user => nil,
      :package_parent => nil,
      :checked_in => false
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(nil.to_s)
    rendered.should contain("".to_s)
    rendered.should contain(nil.to_s)
    rendered.should contain(nil.to_s)
    rendered.should contain(nil.to_s)
    rendered.should contain(false.to_s)
  end
end
