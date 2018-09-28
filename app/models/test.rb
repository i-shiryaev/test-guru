class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  belongs_to :author, class_name: 'User'
  has_many :users, through: :passed_tests

  def self.by_category(name)
    self.joins(:category).where("categories.title = ?", name).order(title: :desc).pluck(:title)
  end
end
