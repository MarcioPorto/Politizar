require 'rails_helper'

RSpec.describe "parties/new", type: :view do
  before(:each) do
    assign(:party, Party.new(
      :name => "MyString",
      :description => "MyText",
      :country => nil
    ))
  end

  it "renders new party form" do
    render

    assert_select "form[action=?][method=?]", parties_path, "post" do

      assert_select "input[name=?]", "party[name]"

      assert_select "textarea[name=?]", "party[description]"

      assert_select "input[name=?]", "party[country_id]"
    end
  end
end
