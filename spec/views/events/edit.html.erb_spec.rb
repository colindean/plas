require 'spec_helper'

describe "events/edit.html.erb" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :new_record? => false,
      :name => "MyString",
      :address => nil,
      :registration_open => false,
      :visible => false,
      :description => "MyText"
    ))
  end

  it "renders the edit event form" do
    render

    rendered.should have_selector("form", :action => event_path(@event), :method => "post") do |form|
      form.should have_selector("input#event_name", :name => "event[name]")
      form.should have_selector("input#event_address", :name => "event[address]")
      form.should have_selector("input#event_registration_open", :name => "event[registration_open]")
      form.should have_selector("input#event_visible", :name => "event[visible]")
      form.should have_selector("textarea#event_description", :name => "event[description]")
    end
  end
end
