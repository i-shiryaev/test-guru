class User < ApplicationRecord
  has_many :passed_tests
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  has_many :tests, through: :passed_tests

  def tests_by_level(level)
    Test.joins("INNER JOIN passed_tests ON passed_tests.test_id = tests.id")
      .where(level: level, passed_tests: { user_id: id })
  end
end
