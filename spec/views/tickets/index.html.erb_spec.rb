require 'spec_helper'

describe "tickets/index.html.erb" do
  before(:each) do
    assign(:tickets, [
      stub_model(Ticket,
        :event => nil,
        :price => "",
        :available => "",
        :package => false,
        :generates_ticket => nil,
        :generates_number => ""
      ),
      stub_model(Ticket,
        :event => nil,
        :price => "",
        :available => "",
        :package => false,
        :generates_ticket => nil,
        :generates_number => ""
      )
    ])
  end

  it "renders a list of tickets" do
    render
    rendered.should have_selector("tr>td", :content => nil.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => false.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => nil.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
  end
end
