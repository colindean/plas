require 'spec_helper'

describe "transactions/new.html.erb" do
  before(:each) do
    assign(:transaction, stub_model(Transaction,
      :address => nil,
      :email => "MyString",
      :payer_name => "MyString",
      :payer_country => "MyString",
      :processor_userid => "MyString",
      :payment_id => "MyString",
      :type => "MyString",
      :recorded_by => nil,
      :amount => "",
      :comments => "MyText",
      :registration => nil
    ).as_new_record)
  end

  it "renders new transaction form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => transactions_path, :method => "post" do
      assert_select "input#transaction_address", :name => "transaction[address]"
      assert_select "input#transaction_email", :name => "transaction[email]"
      assert_select "input#transaction_payer_name", :name => "transaction[payer_name]"
      assert_select "input#transaction_payer_country", :name => "transaction[payer_country]"
      assert_select "input#transaction_processor_userid", :name => "transaction[processor_userid]"
      assert_select "input#transaction_payment_id", :name => "transaction[payment_id]"
      assert_select "input#transaction_type", :name => "transaction[type]"
      assert_select "input#transaction_recorded_by", :name => "transaction[recorded_by]"
      assert_select "input#transaction_amount", :name => "transaction[amount]"
      assert_select "textarea#transaction_comments", :name => "transaction[comments]"
      assert_select "input#transaction_registration", :name => "transaction[registration]"
    end
  end
end
