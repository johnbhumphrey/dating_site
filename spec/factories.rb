FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person_#{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"} 
    sequence(:nick_name) { |n| "nick_name_#{n}"}  
    password "foobar"
    password_confirmation "foobar"
  end

  factory :profile do
  	age 25
  	zipcode '02493'
  	about_me "valid crap here"
  	good_at "more valid"
  	relationship_status "Single"
  	sex "Male"
  	smokes "No Answer"
  	body_type "No Answer"
  	height 72
  	drinks "No Answer"
  	religion "No Answer"
  	income "No Answer"
  	job "No Answer"
  	language "No Answer"
  	drugs "No Answer"
  	offspring "No Answer"
  	exercise "No Answer"
  	ethnicity "No Answer"
  	interested_in "Male"
  	association :user
  end  

end