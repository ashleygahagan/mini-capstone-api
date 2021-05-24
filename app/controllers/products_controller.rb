class ProductsController < ApplicationController

  before_action :authenticate_admin, except: [:index, :show]

  def index
    products = Product.all
    # if params[:search]
    #   products = Product.where("name iLIKE ?", "%#{params[:search]}%")
    # end
    if params[:category]
      category = Category.find_by("name iLIKE ?", params[:category])
      products = category.products
    end
    render json: products
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      quantity: params[:quantity]
    )
    if product.save
      render json: product
    else
      render json: {errors: product.errors.full_message}, status: :unprocessable_entity
    end
  end

  def show
    product = Product.find(params[:id])
    render json: product
  end

  def update
    product = Product.find(params[:id])
    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.description = params[:description] || product.description
    product.quantity = params[:quantity] || product.quantity
    if product.save
      render json: product
    else
      render json: {errors: product.errors.full_message}, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: {message: "Product has been removed!"}
  end

end