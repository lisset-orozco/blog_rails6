class Article < ApplicationRecord
  belongs_to :user

  has_many :has_categories
  has_many :categories, through: :has_categories

  has_rich_text :content
end
