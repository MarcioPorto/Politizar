require 'rails_helper'

RSpec.describe "representatives/index", type: :view do
  before(:each) do
    assign(:representatives, [
      Representative.create!(
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
      ),
      Representative.create!(
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
      )
    ])
  end

  it "renders a list of representatives" do
    render
    assert_select "tr>td", :text => "Identifier".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "Photo".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "Last Presence Update".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
