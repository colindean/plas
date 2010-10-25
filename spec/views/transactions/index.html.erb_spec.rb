require 'spec_helper'

describe "transactions/index.html.erb" do
  before(:each) do
    assign(:transactions, [
      stub_model(Transaction,
        :address => nil,
        :email => "Email",
        :payer_name => "Payer Name",
        :payer_country => "Payer Country",
        :processor_userid => "Processor Userid",
        :payment_id => "Payment",
        :type => "Type",
        :recorded_by => nil,
        :amount => "",
        :comments => "MyText",
        :registration => nil
      ),
      stub_model(Transaction,
        :address => nil,
        :email => "Email",
        :payer_name => "Payer Name",
        :payer_country => "Payer Country",
        :processor_userid => "Processor Userid",
        :payment_id => "Payment",
        :type => "Type",
        :recorded_by => nil,
        :amount => "",
        :comments => "MyText",
        :registration => nil
      )
    ])
  end

  it "renders a list of transactions" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Payer Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Payer Country".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Processor Userid".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Payment".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
