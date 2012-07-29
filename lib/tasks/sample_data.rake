namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    user= User.create!(name: "Admin",
                 nick_name: "Admin", 
                 email: "csahlman@gmail.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    user.toggle!(:admin)
    199.times do |n|
      name  = Faker::Name.name
      nick_name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   nick_name: nick_name,
                   password: password,
                   password_confirmation: password)
    end
    users= User.all
    users.each do |f|
      about_me= Faker::Lorem.sentence(50)
      message_me_if= Faker::Lorem.sentence(15)
      good_at= Faker::Lorem.sentence(20)
      age= Random.rand(18..35)
      sexes= ["Male", "Female"]
      sex= sexes[Random.rand(0..1)]
      zipcode= "02446"
      relationship_status= "Single"
      f.create_profile!(age: age, zipcode: zipcode, relationship_status: relationship_status,
          about_me: about_me, good_at: good_at, message_me_if: message_me_if, 
          interested_in: sex, sex: sex, body_type: "Slender", smokes: "No Answer", 
          drinks: "No Answer", exercise: "No Answer", drugs: "No Answer",
          offspring: "No Answer", income: "No Answer", religion: "No Answer",
          language: "No Answer", ethnicity: "No Answer", nick_name: f.nick_name)
    end
  end
end