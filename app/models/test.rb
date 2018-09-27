class Test < ApplicationRecord
  belongs_to :categories
  has_many :questions
  has_many :passed_tests
  has_one :author, class_name: 'User'
  has_many :users, through: :passed_tests

  def self.by_category(category)
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id")
      .where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
