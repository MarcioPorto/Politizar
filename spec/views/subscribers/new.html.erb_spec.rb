require 'rails_helper'

RSpec.describe "subscribers/new", type: :view do
  before(:each) do
    assign(:subscriber, Subscriber.new(
      :name => "MyString",
      :email => "MyString",
      :regions => nil
    ))
  end

  it "renders new subscriber form" do
    render

    assert_select "form[action=?][method=?]", subscribers_path, "post" do

      assert_select "input[name=?]", "subscriber[name]"

      assert_select "input[name=?]", "subscriber[email]"

      assert_select "input[name=?]", "subscriber[regions_id]"
    end
  end
end
