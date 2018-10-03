class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_amount, on: :create

  scope :correct, -> { where(correct: true) }

  def validate_answers_amount
    if question.answers.size >= 4
      errors.add(:answers, 'question must contain up to 4 answers')
    end
  end
end
