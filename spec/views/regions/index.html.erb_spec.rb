require 'rails_helper'

RSpec.describe "regions/index", type: :view do
  before(:each) do
    assign(:regions, [
      Region.create!(
        :name => "Name",
        :abbreviation => "MyString",
        :country => nil
      ),
      Region.create!(
        :name => "Name",
        :abbreviation => "MyString",
        :country => nil
      )
    ])
  end

  it "renders a list of regions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
