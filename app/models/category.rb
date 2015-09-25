class Category < ActiveRecord::Base
  has_many :apps, through: :app_categories
  has_many :app_categories
end