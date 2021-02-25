class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy arquive unarquive]
  before_action :validate_current_user, only: %i[edit update destroy]

  def index
    @products = Product.where(available: true).shuffle

    #a seta será exclusivamente para a direita, que implica em trocar de peça, randomicamente >> ok
    #um botão com o x tira aquela peça do array de possibilidades que o cliente poderá ver
    #um botão de coração inicia a transação    
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.available = true
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
      redirect_to profile_path(current_user), notice: "Editado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to profile_path(current_user), notice: "Peça apagada com sucesso!"
  end

  def arquive
    @product.update(available: false)
    redirect_to profile_path(current_user)
  end

  def unarquive
    @product.update(available: true)
    redirect_to profile_path(current_user)
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
                                   :category, :type, :size, :available, :description, photos: [])
  end
end
