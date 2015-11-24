class ProductsController < ApplicationController
  
  def index
    @fruit = Product.all 

    sort_attribute = params[:sort_attribute]
    sort_order = params[:sort_order]
    discount = params[:discount]
    puts "============================================="
    p params
    p params[:discount]
    p discount
    puts "============================================="

    random = params[:random]
    if random
      @fruit = Product.limit(1).order("RANDOM()")
    end

    if discount
      @fruit = Product.where("price <= ?", discount.to_i)
    end
    if sort_attribute && sort_order
      @fruit = Product.order(sort_attribute => sort_order)
    end
  end

  def show
  	products_id = params[:id]
  	@pfruit = Product.find_by(id: products_id)
  end

  def new
  end

  def create
  	@product = Product.create(
  		name: params[:name],
  		price: params[:price],
  		image: params[:image],
  		description: params[:description]
  		)
    flash[:success] = "You made a new fruit. THANKS BRAH!"
  	redirect_to '/products'
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description]
      )
    redirect_to "/products"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy

    redirect_to "/products"
  end
end
