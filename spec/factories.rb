FactoryGirl.define do
  factory :user do
    name     "Charlie Sahlman"
    email    "csahlman@gmail.com"
    password "foobar"
    password_confirmation "foobar"
    nick_name "Admin"
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