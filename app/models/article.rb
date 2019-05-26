class Article < ApplicationRecord
  belongs_to :user

  has_many :has_categories
  has_many :categories, through: :has_categories

  has_rich_text :content

  attr_accessor :category_elements

  def save_categories
    # category_elements 1, 2, 3
    # convertir eso en un arreglo 1,2,3 => [1,2,3]
    # categories_array = category_elements.split(',')
    # iterar el arreglo
    return has_categories.destroy_all if category_elements.blank?

    has_categories.where.not(category_id: category_elements).destroy_all

    category_elements.each do |category_id|
      # crear HasCategory
      # unless HasCategory.create(article: self, category_id: category_id).any?
      #   HasCategory.create(article: self, category_id: category_id)
      # end

      HasCategory.find_or_create_by(article: self, category_id: category_id)
    end
  end
end
