class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :validate_current_user, only: %i[edit update destroy]

  def index
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @product.update(product_params)
    if @product.save
      redirect_to @product, notice: "Editado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def validate_current_user
    if @product.user != current_user
      redirect_to products_path, alert: "Você só pode alterar as roupas do seu armário!"
      return
    end 
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :buyable, :exchangeable, :price, 
                                   :category, :type, :size, :available, :description)
  end
end
