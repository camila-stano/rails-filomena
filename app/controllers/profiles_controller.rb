class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update arquived]

  def show
    @gender = @profile.gender
    if @gender == 'Mulher'
      @gender_call = 'a'
    elsif @gender == 'Homem'
      @gender_call = 'o'
    else
      @gender_call = 'e'
    end

  end

  def edit
  end

  def update
    @profile.update(profile_params)
    if @profile.save
      redirect_to @profile, notice: "Editado com sucesso!"
    else
      render :edit
    end
  end

  def arquived
  end

  private

  def set_profile
    @profile = User.find(params[:id])
  end
end
