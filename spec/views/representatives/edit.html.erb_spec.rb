require 'rails_helper'

RSpec.describe "representatives/edit", type: :view do
  before(:each) do
    @representative = assign(:representative, Representative.create!(
      :identifier => "MyString",
      :name => "MyString",
      :full_name => "MyString",
      :gender => "MyString",
      :photo => "MyString",
      :email => "MyString",
      :total_sessions => 1,
      :present_sessions => 1,
      :justified_absences => 1,
      :unjustified_absences => 1,
      :last_presence_update => "MyString",
      :party => nil,
      :region => nil,
      :institution => nil
    ))
  end

  it "renders the edit representative form" do
    render

    assert_select "form[action=?][method=?]", representative_path(@representative), "post" do

      assert_select "input[name=?]", "representative[identifier]"

      assert_select "input[name=?]", "representative[name]"

      assert_select "input[name=?]", "representative[full_name]"

      assert_select "input[name=?]", "representative[gender]"

      assert_select "input[name=?]", "representative[photo]"

      assert_select "input[name=?]", "representative[email]"

      assert_select "input[name=?]", "representative[total_sessions]"

      assert_select "input[name=?]", "representative[present_sessions]"

      assert_select "input[name=?]", "representative[justified_absences]"

      assert_select "input[name=?]", "representative[unjustified_absences]"

      assert_select "input[name=?]", "representative[last_presence_update]"

      assert_select "input[name=?]", "representative[party_id]"

      assert_select "input[name=?]", "representative[region_id]"

      assert_select "input[name=?]", "representative[institution_id]"
    end
  end
end
