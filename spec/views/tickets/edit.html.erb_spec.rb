require 'spec_helper'

describe "tickets/edit.html.erb" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :new_record? => false,
      :event => nil,
      :price => "",
      :available => "",
      :package => false,
      :generates_ticket => nil,
      :generates_number => ""
    ))
  end

  it "renders the edit ticket form" do
    render

    rendered.should have_selector("form", :action => ticket_path(@ticket), :method => "post") do |form|
      form.should have_selector("input#ticket_event", :name => "ticket[event]")
      form.should have_selector("input#ticket_price", :name => "ticket[price]")
      form.should have_selector("input#ticket_available", :name => "ticket[available]")
      form.should have_selector("input#ticket_package", :name => "ticket[package]")
      form.should have_selector("input#ticket_generates_ticket", :name => "ticket[generates_ticket]")
      form.should have_selector("input#ticket_generates_number", :name => "ticket[generates_number]")
    end
  end
end
