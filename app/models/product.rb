class Product < ActiveRecord::Base

  belongs_to :supplier
  has_many :images
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
end
