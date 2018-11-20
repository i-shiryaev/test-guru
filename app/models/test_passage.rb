class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :next_question

  def accept!(answers_ids)
    self.correct_question += 1 if correct_answer?(answers_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def question_number
    completed_questions.size + 1
  end

  def success?
    correct_answers_percentage >= 85
  end

  def correct_answers_percentage
    correct_question.to_f / test.questions.size * 100
  end

  private

  def next_question
    if current_question.nil?
      self.current_question = test.questions.first if test.present?
    else
      self.current_question = remaining_questions.first
    end
  end

  def correct_answer?(answers_ids)
    correct_answers.ids.sort == Array(answers_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def remaining_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end

  def completed_questions
    test.questions.order(:id).where('id < ?', current_question.id)
  end
end
