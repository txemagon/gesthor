require 'spec_helper'

describe "training_levels/new" do
  before(:each) do
    assign(:training_level, stub_model(TrainingLevel,
      :name => "MyString",
      :description => "MyText",
      :parent_id => 1
    ).as_new_record)
  end

  it "renders new training_level form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => training_levels_path, :method => "post" do
      assert_select "input#training_level_name", :name => "training_level[name]"
      assert_select "textarea#training_level_description", :name => "training_level[description]"
      assert_select "input#training_level_parent_id", :name => "training_level[parent_id]"
    end
  end
end
