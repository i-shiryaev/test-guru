class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  validates :body, presence: true
  validate :answers_amount

  def answers_amount
    if answers.size < 1 && answers.size > 4
      errors.add(:answers, 'must contain from 1 to 4 answers')
    end
  end
end
