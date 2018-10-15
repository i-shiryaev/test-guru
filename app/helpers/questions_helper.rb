module QuestionsHelper
  def question_header(action, question)
    "#{action} #{question.test.title} question"
  end
end
