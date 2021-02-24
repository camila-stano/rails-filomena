class TradesController < ApplicationController
  before_action :set_trade, only: %i[show edit update]
  # before_action :validate_current_user

  def index
  end

  def new
    #a action de new não vai existir porque o usuário não terá acesso ao formulário de criação da trade, será automático
    @trade = Trade.new
  end

  def create
    @trade = Trade.new(trade_params)
    @trade.user = current_user
    #adicionar addEventListiner para o botão de super like e fazer um @trade.super_like = true
    if @trade.save
      redirect_to @trade
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

  def set_trade
    @trade = Trade.find(params[:id])
  end

  def trade_params
    params.require(:trade).permit(:status)
  end

end
