require 'rails_helper'

RSpec.describe "bills/edit", type: :view do
  before(:each) do
    @bill = assign(:bill, Bill.create!(
      :identifier => "MyString",
      :description => "MyText",
      :result => "MyString",
      :result_description => "MyText",
      :institution => nil
    ))
  end

  it "renders the edit bill form" do
    render

    assert_select "form[action=?][method=?]", bill_path(@bill), "post" do

      assert_select "input[name=?]", "bill[identifier]"

      assert_select "textarea[name=?]", "bill[description]"

      assert_select "input[name=?]", "bill[result]"

      assert_select "textarea[name=?]", "bill[result_description]"

      assert_select "input[name=?]", "bill[institution_id]"
    end
  end
end
