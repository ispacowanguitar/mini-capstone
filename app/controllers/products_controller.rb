class ProductsController < ApplicationController
  
  def index

    def form
      @user = current_user
    end

    @fruit = Product.all 

    sort_attribute = params[:sort_attribute]
    sort_order = params[:sort_order]
    discount = params[:discount]
   
    p params[:discount]
   
    random = params[:random]
    if random
      puts "HEY HEY HEY!!!! THIS IS THE RANDOM GENERATOR"
      @fruit = []
      @fruit << Product.order("RAND()").first
    end

    if discount
      @fruit = Product.where("price <= ?", 20)
    end

    if sort_attribute && sort_order
      @fruit = Product.order(sort_attribute => sort_order)
    end

    if params[:category]
      @fruit = Category.find_by(name: params[:category]).products
    end
  end

  def show

  	products_id = params[:id]
  	@fruit = Product.find_by(id: products_id)
    
  end

  def new
  end

  def create
  	@product = Product.create(
  		name: params[:name],
  		price: params[:price],
  		description: params[:description]
  		)

    Image.create(
      url: params[:image],
      products_id: @product.id
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
      description: params[:description]
      )

    Image.create(
      url: params[:image],
      product_id: @product.id
      )
    redirect_to "/products"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy

    redirect_to "/products"
  end
end
