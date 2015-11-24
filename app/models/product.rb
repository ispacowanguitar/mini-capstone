class Product < ActiveRecord::Base
  def description_list
    description.split(",")
  end

  def sale_message
    if price.scan(/\d+/).join.to_i < 47
      return "THIS FRUIT IS CHEAP!"
    end
  end
end
