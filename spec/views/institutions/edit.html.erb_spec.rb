require 'rails_helper'

RSpec.describe "institutions/edit", type: :view do
  before(:each) do
    @institution = assign(:institution, Institution.create!(
      :name => "MyString",
      :member => "MyString",
      :member_plural => "MyString",
      :country => nil,
      :region => nil
    ))
  end

  it "renders the edit institution form" do
    render

    assert_select "form[action=?][method=?]", institution_path(@institution), "post" do

      assert_select "input[name=?]", "institution[name]"

      assert_select "input[name=?]", "institution[country_id]"

      assert_select "input[name=?]", "institution[region_id]"
    end
  end
end
