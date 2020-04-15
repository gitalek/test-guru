class Question < ApplicationRecord
  ANSWERS_MAX_LIMIT = 4

  belongs_to :test

  has_many :answers

  scope :right_answers, ->(id) { find(id).answers.where(correct: true) }

  validates :body, presence: true
end
