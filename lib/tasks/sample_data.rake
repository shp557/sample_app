namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Sachin Patel",
                 email: "sachb52@gmail.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    

  end
end