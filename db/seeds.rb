require 'faker'

100.times do |n|
  sample_name = Gimei.unique.name.kanji
  sample_email = Faker::Internet.email
  sample_address = Gimei.address.kanji
  sample_age = rand(100)
  
  User.create!(
    name: sample_name,
    email: sample_email,
    address: sample_address,
    age: sample_age
  )
end
