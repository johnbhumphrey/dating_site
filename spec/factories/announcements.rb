# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :announcement do
    message "MyString"
    starts_at "2012-09-12 11:40:56"
    ends_at "2012-09-12 11:40:56"
  end
end
