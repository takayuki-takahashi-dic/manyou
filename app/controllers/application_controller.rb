class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :set_request_filter
  def set_request_filter
    Thread.current[:request] = request
  end

  class Forbidden < ActionController::ActionControllerError; end
  rescue_from Forbidden, with: :rescue403

  private
    def rescue403(e)
      @exception = e
      render template: 'errors/forbidden', status: 403
    end
end
