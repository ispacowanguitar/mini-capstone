class Product < ActiveRecord::Base

  belongs_to :supplier
  belongs_to :user
  has_many :orders
  has_many :images
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  SALES_TAX = 0.09

  def description_list
    description.split(",")
  end

  def sale_message
    if price < 47
      return "THIS FRUIT IS CHEAP!"
    end
  end

  def price_with_tax
    (price.to_f * SALES_TAX) + price
  end

  def categorie_list
    names = []
    categories.each do |category|
      names << category.name
    end
    names.join(", ")
  end
end
