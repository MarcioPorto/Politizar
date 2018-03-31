require 'rails_helper'

RSpec.describe "votes/edit", type: :view do
  before(:each) do
    @vote = assign(:vote, Vote.create!(
      :description => "MyString",
      :bill => nil,
      :representative => nil
    ))
  end

  it "renders the edit vote form" do
    render

    assert_select "form[action=?][method=?]", vote_path(@vote), "post" do

      assert_select "input[name=?]", "vote[description]"

      assert_select "input[name=?]", "vote[bill_id]"

      assert_select "input[name=?]", "vote[representative_id]"
    end
  end
end
