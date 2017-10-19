class User < ApplicationRecord
  has_many :questions
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_many :answers
end
