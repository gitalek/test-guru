class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user, foreign_key: :creator_id

  has_many :tests_users
  has_many :users, through: :tests_users
  has_many :questions

  validates :title, presence: true
  validates :level, numericality: {
    only_integer: { greater_than_or_equal_to: 0 }
  }
  validates :level, uniqueness: {
    scope: :title,
    message: 'not a unique combination of level and title attributes'
  }

  scope :by_level, ->(level) { where(level: level) }
  scope :simple,   -> { by_level(0..1) }
  scope :medium,   -> { by_level(2..4) }
  scope :hard,     -> { by_level(4..Float::INFINITY) }

  # scope :by_category, lambda(category) {
  #   joins(:category).where(categories: { title: category })
  # }
end
