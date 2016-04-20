class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def create
  	@product = Product.create( product_params )
  	if flash[:errors] = @product.errors.full_messages
  		redirect_to '/products/new'
  	else
  		redirect_to '/products'
  	end
  end
  def new
  	@categories = Category.all
  	
  end
  def show
  	@product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to "/products"
    else 
      flash[:errors] = @product.errors.full_messages
      redirect_to "/products/#{@product.id}/edit"
    end
  end
  def destroy
    Product.find(params[:id]).destroy
    redirect_to '/products'
  end
  private 
  def product_params
   params.require(:product).permit(:name, :description, :price, :category_id)
  end
end
