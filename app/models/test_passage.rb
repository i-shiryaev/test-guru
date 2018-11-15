class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_save :before_save_set_next_question

  def accept!(answers_ids)
    if correct_answer?(answers_ids)
      self.correct_question += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def question_place
    test.questions.size - remaining_questions.size
  end

  def result_message
    action = success? ? 'completed' : 'failed'
    "You #{action} the test."
  end

  def success?
    correct_answers_percentage >= 85
  end

  def correct_answers_percentage
    correct_question.to_f / test.questions.size * 100
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answers_ids)
    correct_answers.ids.sort == Array(answers_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_save_set_next_question
    self.current_question = remaining_questions.first
  end

  def remaining_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end
end
