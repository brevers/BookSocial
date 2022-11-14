# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :ensure_profile_is_complete, only: [:main]

  def index; end

  def main; end

  def friends; end

  def contact_us; end

  private

  def ensure_profile_is_complete
    return unless current_user.profile.name.blank?

    redirect_to edit_profile_path(current_user.profile)
  end
end
