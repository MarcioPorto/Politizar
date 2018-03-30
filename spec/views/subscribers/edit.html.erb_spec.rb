require 'rails_helper'

RSpec.describe "subscribers/edit", type: :view do
  before(:each) do
    @subscriber = assign(:subscriber, Subscriber.create!(
      :name => "MyString",
      :email => "MyString",
      :region => nil
    ))
  end

  it "renders the edit subscriber form" do
    render

    assert_select "form[action=?][method=?]", subscriber_path(@subscriber), "post" do

      assert_select "input[name=?]", "subscriber[name]"

      assert_select "input[name=?]", "subscriber[email]"

      assert_select "input[name=?]", "subscriber[regions_id]"
    end
  end
end
