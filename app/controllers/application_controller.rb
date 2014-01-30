class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_active_page

  private

  def set_active_page
    @active_page = request.path.delete('/')
  end
end
