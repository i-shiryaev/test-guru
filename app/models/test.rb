class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :level, uniqueness: { scope: :title }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, ->(name) {
    joins(:category).where(categories: { title: name }).order(title: :desc).pluck(:title) }
  scope :by_level, ->(level) { where(level: level) }
end
