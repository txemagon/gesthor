require 'spec_helper'

describe "training_levels/index" do
  before(:each) do
    assign(:training_levels, [
      stub_model(TrainingLevel,
        :name => "Name1",
	:short_name => "Abbr1",
        :description => "MyText"
      ),
      stub_model(TrainingLevel,
        :name => "Name2",
	:short_name => "Abbr2",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of training_levels" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
# assert_select "tr>td", :text => "Name1".to_s, :count => 1
# assert_select "tr>td", :text => "Name2".to_s, :count => 1
# assert_select "tr>td", :text => "MyText".to_s, :count => 2
# assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
