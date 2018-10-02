class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 },
                    uniqueness: { scope: :title }

  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }
  scope :by_category, ->(name) {
    joins(:category).where(categories: { title: name }).order(title: :desc) }
  scope :by_level, ->(level) { where(level: level) }

  def self.titles_by_category(name)
    by_category(name).pluck(:title)
  end
end
