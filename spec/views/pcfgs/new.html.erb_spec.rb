require 'spec_helper'

describe "pcfgs/new.html.erb" do
  before(:each) do
    assign(:pcfg, stub_model(Pcfg,
      :key => "MyText",
      :value => "MyText",
      :last_modified_by => nil
    ).as_new_record)
  end

  it "renders new pcfg form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => pcfgs_path, :method => "post" do
      assert_select "textarea#pcfg_key", :name => "pcfg[key]"
      assert_select "textarea#pcfg_value", :name => "pcfg[value]"
      assert_select "input#pcfg_last_modified_by", :name => "pcfg[last_modified_by]"
    end
  end
end
