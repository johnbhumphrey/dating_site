# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    password_digest "MyString"
    email "MyString"
    admin false
  end
end
