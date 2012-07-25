# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :private_message do
    title "MyString"
    body "MyText"
    read_at "2012-07-19 11:13:34"
  end
end
