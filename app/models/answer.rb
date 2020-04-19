class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  validate :validate_answers_per_question_limit, on: :create

  private

  def validate_answers_per_question_limit
    limit = Question::ANSWERS_MAX_LIMIT
    if question.answers.count >= limit
      message = "Quesiton with id #{question_id} \
                has already achieved maximum answers limit - #{limit}"
      errors.add(:base, message)
    end
  end
end
