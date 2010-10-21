require 'spec_helper'

describe "pcfgs/edit.html.erb" do
  before(:each) do
    @pcfg = assign(:pcfg, stub_model(Pcfg,
      :new_record? => false,
      :key => "MyText",
      :value => "MyText",
      :last_modified_by => nil
    ))
  end

  it "renders the edit pcfg form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => pcfg_path(@pcfg), :method => "post" do
      assert_select "textarea#pcfg_key", :name => "pcfg[key]"
      assert_select "textarea#pcfg_value", :name => "pcfg[value]"
      assert_select "input#pcfg_last_modified_by", :name => "pcfg[last_modified_by]"
    end
  end
end
