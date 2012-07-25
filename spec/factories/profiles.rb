# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    about_me "MyText"
    message_me_if "MyText"
    good_at "MyText"
    relationship_status "MyString"
    age 1
    sex "MyString"
    location "MyString"
    user_id 1
  end
end
