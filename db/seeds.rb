User.delete_all
Question.delete_all
User.delete_all

require 'faker'

20.times do
   first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  name = [first_name, last_name].join(' ')
  username = Faker::Internet.user_name(name, %w(._-))
  user = User.new(first_name: first_name, last_name: last_name, username: username, email: Faker::Internet.safe_email(first_name), password: '123')
  user.save
  question = Question.new(question_text: Faker::Lorem.sentence, user_id: user.id)
  question.save
end

david = User.create!(first_name: "david", last_name: "skaggs",
                    username: "david", email: "test@test.com",
                    password: "test")
