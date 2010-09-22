require 'spec_helper'

describe "registrations/index.html.erb" do
  before(:each) do
    assign(:registrations, [
      stub_model(Registration,
        :ticket => nil,
        :price_paid => "",
        :purchaser => nil,
        :user => nil,
        :package_parent => nil,
        :checked_in => false
      ),
      stub_model(Registration,
        :ticket => nil,
        :price_paid => "",
        :purchaser => nil,
        :user => nil,
        :package_parent => nil,
        :checked_in => false
      )
    ])
  end

  it "renders a list of registrations" do
    render
    rendered.should have_selector("tr>td", :content => nil.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => nil.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => nil.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => nil.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => false.to_s, :count => 2)
  end
end
