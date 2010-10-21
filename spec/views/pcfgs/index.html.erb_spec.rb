require 'spec_helper'

describe "pcfgs/index.html.erb" do
  before(:each) do
    assign(:pcfgs, [
      stub_model(Pcfg,
        :key => "MyText",
        :value => "MyText",
        :last_modified_by => nil
      ),
      stub_model(Pcfg,
        :key => "MyText",
        :value => "MyText",
        :last_modified_by => nil
      )
    ])
  end

  it "renders a list of pcfgs" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
