FactoryBot.define do
  factory :bill do
    identifier "MyString"
    description "MyText"
    vote_date "2018-03-31"
    result "MyString"
    result_description "MyText"
    institution nil
  end
end
