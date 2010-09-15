require 'spec_helper'

describe "events/show.html.erb" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "Name",
      :address => nil,
      :registration_open => false,
      :visible => false,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain(nil.to_s)
    rendered.should contain(false.to_s)
    rendered.should contain(false.to_s)
    rendered.should contain("MyText".to_s)
  end
end
