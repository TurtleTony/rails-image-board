class ApplicationController < ActionController::Base
  before_action :set_filter

  def set_filter
    @filter = session[:filter] || (session[:filter] = :sfw)
  end
end
