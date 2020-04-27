class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: :Test, foreign_key: :creator_id

  validates :email, presence: true

  def tests_by_level(level)
    tests.where(level: level) # ?? use scope?
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
