require 'spec_helper'

describe "pcfgs/show.html.erb" do
  before(:each) do
    @pcfg = assign(:pcfg, stub_model(Pcfg,
      :key => "MyText",
      :value => "MyText",
      :last_modified_by => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
