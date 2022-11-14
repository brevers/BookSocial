# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || '/main'
  end

  def ensure_current_user
    return redirect_to new_user_session_url unless current_user
  end
end
