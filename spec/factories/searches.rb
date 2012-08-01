# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :search do
    keywords "MyString"
    min_age 1
    max_age 1
    min_height 1
    max_height 1
    sex "MyString"
    relationship_status "MyString"
  end
end
