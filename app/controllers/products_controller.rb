class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :favorite]
  PER = 15

  def index
    @products = Product.page(params[:page]).per(PER)

  end

  def show
    @reviews = @product.reviews 
    @review = @reviews.new
  end
  
  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)

    @product.save
    redirect_to product_url @product
  end

  def edit
    @categories = Category.all
  end

  def update
    @product.update(product_params)
    redirect_to product_url @product
  end

  def destory
    @product.destory
    redirect_to product_url
  end

  def favorite
    current_user.toggle_like!(@product)
    redirect_product
  end

  private
    def product_params
      params.require(:product).permit(:name, :description ,:price, :category_id)
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def redirect_product
      redirect_to product_url @product
    end
end
