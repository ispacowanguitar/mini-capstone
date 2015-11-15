class ProductsController < ApplicationController
  def products
    @fruit = Product.all
    
  end
  def apples
    @apple = Product.last
  end
end
