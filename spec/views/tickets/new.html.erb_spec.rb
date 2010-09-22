require 'spec_helper'

describe "tickets/new.html.erb" do
  before(:each) do
    assign(:ticket, stub_model(Ticket,
      :new_record? => true,
      :event => nil,
      :price => "",
      :available => "",
      :package => false,
      :generates_ticket => nil,
      :generates_number => ""
    ))
  end

  it "renders new ticket form" do
    render

    rendered.should have_selector("form", :action => tickets_path, :method => "post") do |form|
      form.should have_selector("input#ticket_event", :name => "ticket[event]")
      form.should have_selector("input#ticket_price", :name => "ticket[price]")
      form.should have_selector("input#ticket_available", :name => "ticket[available]")
      form.should have_selector("input#ticket_package", :name => "ticket[package]")
      form.should have_selector("input#ticket_generates_ticket", :name => "ticket[generates_ticket]")
      form.should have_selector("input#ticket_generates_number", :name => "ticket[generates_number]")
    end
  end
end
