Question.delete_all

20.times do
  question = Question.new(question_text: Faker::Lorem.sentence)
  question.save
end
