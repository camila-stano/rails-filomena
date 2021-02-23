class ClothesController < ApplicationController
  before_action :set_clothe, only: %i[show edit update destroy]

  def index
    @clothes = Clothe.all.shuffle
  end

  def show
  end

  def new
    @clothe = Clothe.new
  end

  def create
    @clothe = Clothe.new(clothe_params)
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
      redirect_to @clothe
    else
      render :edit
    end
  end

  def destroy
    @clothe.destroy
    redirect_to clothes_path
  end

  private

  def set_clothe
    @clothe = Clothe.find(params[:id])
  end

  def clothe_params
    params.require(:clothe).permit(:name :buyable :exchangeable :price :category :type :size :available :description)
  end

end
