Question.delete_all
User.delete_all

20.times do
  question = Question.new(question_text: Faker::Lorem.sentence)
  question.save
end

david = User.create!(first_name: "david", last_name: "skaggs",
                    username: "david", email: "test@test.com",
                    password: "test")
