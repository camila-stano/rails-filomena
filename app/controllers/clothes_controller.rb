class ClothesController < ApplicationController
  before_action :set_clothe, only: %i[show edit update destroy]
  before_action :validate_current_user, only: %i[edit update destroy]

  def index
  end

  def show
  end

  def new
    @clothe = Clothe.new
  end

  def create
    @clothe = Clothe.new(clothe_params)
    @clothe.user = current_user

    if @clothe.save
      redirect_to @clothe
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @clothe.update(clothe_params)
    if @clothe.save
      redirect_to @clothe, notice: "Editado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @clothe.destroy
    redirect_to clothes_path
  end

  private

  def validate_current_user
    if @clothe.user != current_user
      redirect_to clothes_path, alert: "Você só pode alterar as roupas do seu armário!"
      return
    end 
  end

  def set_clothe
    @clothe = Clothe.find(params[:id])
  end

  def clothe_params
    params.require(:clothe).permit(:name, :buyable, :exchangeable, :price, 
                                   :category, :type, :size, :available, :description)
  end

end
