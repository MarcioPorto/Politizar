require 'rails_helper'

RSpec.describe "institutions/new", type: :view do
  before(:each) do
    assign(:institution, Institution.new(
      :name => "MyString",
      :country => nil,
      :region => nil
    ))
  end

  it "renders new institution form" do
    render

    assert_select "form[action=?][method=?]", institutions_path, "post" do

      assert_select "input[name=?]", "institution[name]"

      assert_select "input[name=?]", "institution[country_id]"

      assert_select "input[name=?]", "institution[region_id]"
    end
  end
end
