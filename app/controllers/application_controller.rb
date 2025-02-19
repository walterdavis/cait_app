class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def authenticate_admin!
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials.admin_user && password == Rails.application.credentials.admin_pw
    end
  end
end
