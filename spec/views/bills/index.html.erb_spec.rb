require 'rails_helper'

RSpec.describe "bills/index", type: :view do
  before(:each) do
    assign(:bills, [
      Bill.create!(
        :identifier => "Identifier",
        :description => "MyText",
        :result => "Result",
        :result_description => "MyText",
        :institution => nil
      ),
      Bill.create!(
        :identifier => "Identifier",
        :description => "MyText",
        :result => "Result",
        :result_description => "MyText",
        :institution => nil
      )
    ])
  end

  it "renders a list of bills" do
    render
    assert_select "tr>td", :text => "Identifier".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Result".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
