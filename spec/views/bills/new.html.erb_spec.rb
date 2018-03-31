require 'rails_helper'

RSpec.describe "bills/new", type: :view do
  before(:each) do
    assign(:bill, Bill.new(
      :identifier => "MyString",
      :description => "MyText",
      :result => "MyString",
      :result_description => "MyText",
      :institution => nil
    ))
  end

  it "renders new bill form" do
    render

    assert_select "form[action=?][method=?]", bills_path, "post" do

      assert_select "input[name=?]", "bill[identifier]"

      assert_select "textarea[name=?]", "bill[description]"

      assert_select "input[name=?]", "bill[result]"

      assert_select "textarea[name=?]", "bill[result_description]"

      assert_select "input[name=?]", "bill[institution_id]"
    end
  end
end
