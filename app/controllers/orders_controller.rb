class OrdersController < ApplicationController
  def create

    product = Product.find_by(id: params[:product_id])
    quantity = params[:theamount].to_i
    subtotal = quantity * product.price
    tax = subtotal * Product::SALES_TAX
    total = subtotal + tax

    puts " ================================"
    puts "Your subtotal is: #{subtotal}"
    puts "Your tax is #{tax}"
    puts "Your total is #{total}"
    puts " ==================================="

    order = Order.create(
      user_id: current_user.id,
      quantity: params[:theamount],
      product_id: params[:product_id],
      subtotal: subtotal,
      tax: tax,
      total: total
      )

    
    redirect_to "/orders/show/#{order.id}"
  end

  def show
   @order = Order.find_by(id: params[:id])
   product_id = @order.product_id
   @product = Product.find_by(id: product_id)
  end
end
