class TradesController < ApplicationController
  before_action :set_product, only: %i[show new create edit update]
  # before_action :validate_current_user

  def index
    all_trades = Trade.all
    all_products = current_user.products
    user_products = []
    
    all_products.each do |product|
      user_products << product.id
    end

    @trades = []  
    all_trades.each do |trade|
      if user_products.include?(trade.product_id)
        @trades << trade
      end
    end

    if @trades.nil?
      ""
    end 

    @user = User.all
    @products = Product.all
  end

  def new
    #a action de new não vai existir porque o usuário não terá acesso ao formulário de criação da trade, será automático
    @trade = Trade.new
  end

  def create
    @trade = Trade.new(trade_params)
    @trade.user = current_user
    @trade.product = @product
    #adicionar addEventListiner para o botão de super like e fazer um @trade.super_like = true
    if @trade.save
      redirect_to trades_path, notice: "Mensagem enviada, agora é só aguardar!"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @trade.update(trade_params)
    if @trade.save
      redirect_to @trade, notice: "Editado com sucesso!"
    else
      render :edit
    end
  end

  private

  # def validate_current_user
  #   if @trade.user != current_user
  #     redirect_to clothes_path, alert: "Você só pode ver as suas transações!"
  #     return
  #   end 
  # end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def trade_params
    params.require(:trade).permit(:status, :content)
  end

end
