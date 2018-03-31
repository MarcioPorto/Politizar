require 'rails_helper'

RSpec.describe "votes/new", type: :view do
  before(:each) do
    assign(:vote, Vote.new(
      :description => "MyString",
      :bill => nil,
      :representative => nil
    ))
  end

  it "renders new vote form" do
    render

    assert_select "form[action=?][method=?]", votes_path, "post" do

      assert_select "input[name=?]", "vote[description]"

      assert_select "input[name=?]", "vote[bill_id]"

      assert_select "input[name=?]", "vote[representative_id]"
    end
  end
end
