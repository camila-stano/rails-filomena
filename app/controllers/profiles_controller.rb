class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update]

  def show
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

  private

  def set_profile
    @profile = User.find(params[:id])
  end
end
