class App < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :categories, through: :app_categories
  has_many :app_categories
  has_many :comments

  validates :title, presence: true, length: {minimum: 5}, uniqueness: true
  validates :description, presence: true
end