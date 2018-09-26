class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins("INNER JOIN passed_tests ON passed_tests.test_id = tests.id")
      .where(level: level, passed_tests: { user_id: id })
  end
end
