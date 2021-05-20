class SuppliersController < ApplicationController
  def index
    suppliers = Supplier.all
    if params[:search]
      suppliers = Supplier.where("name iLIKE ?", "%#{params[:search]}%")
    end
    render json: suppliers
  end

  def create
    supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number],
    )
    render json: supplier
  end

  def show
    supplier = Supplier.find(params[:id])
    render json: supplier
  end

  def update
    supplier = Supplier.find(params[:id])
    supplier.name = params[:name] || supplier.name
    supplier.email = params[:email] || supplier.email
    supplier.phone_number = params[:phone_number] || supplier.phone_number
    supplier.save
  end

  def destroy
    supplier = Supplier.find(params[:id])
    supplier.destroy
    render json: {message: "Supplier has been removed!"}
  end
end
