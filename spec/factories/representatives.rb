FactoryBot.define do
  factory :representative do
    identifier "MyString"
    name "MyString"
    full_name "MyString"
    gender "MyString"
    photo "MyString"
    email "MyString"
    total_sessions 1
    present_sessions 1
    justified_absences 1
    unjustified_absences 1
    last_presence_update "MyString"
    party nil
    region nil
    institution nil
  end
end
