class Question < ApplicationRecord
  # Remember to create a migration!
  validates :question_text, presence: true
end
