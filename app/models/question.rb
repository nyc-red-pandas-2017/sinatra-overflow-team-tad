class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  # Remember to create a migration!
  validates :question_text, presence: true

end
