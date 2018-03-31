require 'rails_helper'

RSpec.describe "bills/show", type: :view do
  before(:each) do
    @bill = assign(:bill, Bill.create!(
      :identifier => "Identifier",
      :description => "MyText",
      :result => "Result",
      :result_description => "MyText",
      :institution => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Identifier/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Result/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
