FactoryGirl.define do
  factory :user do |f|
    f.sequence(:name)  { |n| "Person_#{n}" }
    f.sequence(:email) { |n| "person_#{n}@example.com"} 
    f.sequence(:nick_name) { |n| "nick_name_#{n}"}  
    f.password "foobar"
    f.password_confirmation "foobar"
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

  factory :search do
    min_age 18
    max_age 35
    min_height 35
    max_height 80
    sex "Male"
    relationship_status "Single"
    interested_in "Male"
    save_search true
    association :profile
  end  

  factory :private_message do |f|
    f.sequence(:body) { |n| "This is a body of a message :) #{n}" }
    f.association :sender, factory: :profile
    f.association :receiver, factory: :profile

      factory :reply do
        sequence(:body) { |n| "This is a body of message #{n}" }
        association :conversation
      end  
  end  
end