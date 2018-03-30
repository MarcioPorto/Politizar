require 'rails_helper'

RSpec.describe "subscribers/show", type: :view do
  before(:each) do
    @subscriber = assign(:subscriber, Subscriber.create!(
      :name => "Name",
      :email => "Email",
      :region => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(//)
  end
end
