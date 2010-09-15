require 'spec_helper'

describe "events/index.html.erb" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :name => "Name",
        :address => nil,
        :registration_open => false,
        :visible => false,
        :description => "MyText"
      ),
      stub_model(Event,
        :name => "Name",
        :address => nil,
        :registration_open => false,
        :visible => false,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of events" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => nil.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => false.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => false.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
  end
end
