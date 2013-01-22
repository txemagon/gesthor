require 'spec_helper'

describe "training_levels/show" do
  before(:each) do
    @training_level = assign(:training_level, stub_model(TrainingLevel,
      :name => "Name",
      :short_name => "Abbrv",
      :description => "MyText",
      :parent_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
