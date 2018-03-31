require 'rails_helper'

RSpec.describe "parties/index", type: :view do
  before(:each) do
    assign(:parties, [
      Party.create!(
        :name => "Name",
        :description => "MyText",
        :country => nil
      ),
      Party.create!(
        :name => "Name",
        :description => "MyText",
        :country => nil
      )
    ])
  end

  it "renders a list of parties" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
