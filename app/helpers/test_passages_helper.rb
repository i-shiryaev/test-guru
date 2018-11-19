module TestPassagesHelper
  def result_message(success)
    action = success ? 'completed' : 'failed'
    "You #{action} the test."
  end
end
