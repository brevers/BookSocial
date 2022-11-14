# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update]

  # To show profile
  def show
  end

  # To edit profile
  def edit
  end

  # To update profile
  def update
    if current_user.profile.update(profile_params)
      redirect_to profile_path(current_user.profile), notice: 'Your profile has been updated'
    else
      render :edit
    end
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new
    @profile.name = params[:name]
    @profile.username = params[:username]
    @profile.lastname = params[:lastname]
  end

  # creation private method
  private

  def profile_params
    params.require(:profile).permit(:name, :username, :lastname)
  end

  def set_profile
    @profile = (current_user.profile ||= Profile.create)
  end
end
