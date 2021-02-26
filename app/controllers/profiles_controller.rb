class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update arquived any_available?]

  def show
    @gender = @profile.gender
    if @gender == 'Mulher'
      @gender_call = 'a'
    elsif @gender == 'Homem'
      @gender_call = 'o'
    else
      @gender_call = 'e'
    end

    rating
    any_available?
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
      @all_ratings = 0
      @profile.trades.each do |trade|
        next if trade.review_rating.nil? 
        @all_ratings += trade.review_rating
      end
      @rating = @all_ratings == 0 || @all_ratings.nil? ? "☆ ☆ ☆ ☆ ☆" : '★' * (@all_ratings / size)

    else
      @rating = "☆ ☆ ☆ ☆ ☆"
    end
  end
  
  def arquived
    any_arquived?
  end

  
  private
  
  def set_profile
    @profile = User.find(params[:id])
  end

  def any_available?
    @available = false
    @profile.products.each do |product|
      if product.available == true
        @available = true
        break
      end
    end
    @available
  end

  def any_arquived?
    @arquived = false
    current_user.products.each do |product|
      if product.available == false
        @arquived = true
        break
      end
    end
    @arquived
  end
end
