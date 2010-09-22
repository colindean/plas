require 'spec_helper'

describe "tickets/show.html.erb" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :event => nil,
      :price => "",
      :available => "",
      :package => false,
      :generates_ticket => nil,
      :generates_number => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(nil.to_s)
    rendered.should contain("".to_s)
    rendered.should contain("".to_s)
    rendered.should contain(false.to_s)
    rendered.should contain(nil.to_s)
    rendered.should contain("".to_s)
  end
end
