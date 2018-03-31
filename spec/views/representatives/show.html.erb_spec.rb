require 'rails_helper'

RSpec.describe "representatives/show", type: :view do
  before(:each) do
    @representative = assign(:representative, Representative.create!(
      :identifier => "Identifier",
      :name => "Name",
      :full_name => "Full Name",
      :gender => "Gender",
      :photo => "Photo",
      :email => "Email",
      :total_sessions => 2,
      :present_sessions => 3,
      :justified_absences => 4,
      :unjustified_absences => 5,
      :last_presence_update => "Last Presence Update",
      :party => nil,
      :region => nil,
      :institution => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Identifier/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/Photo/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Last Presence Update/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
