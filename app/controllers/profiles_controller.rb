class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update rating]

  def show
    rating
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

  def rating
    if @profile.trades.present?
      size = @profile.trades.size
      all_ratings = 0
      @profile.trades.each do |trade|
        all_ratings += trade.review_rating
      end
      @rating = '⭐' * (all_ratings / size)

    else
      @rating = "Novo usuário, seja o primeiro a negociar com ele!"
    end
  end

  private

  def set_profile
    @profile = User.find(params[:id])
  end
end
