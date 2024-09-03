class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :authorize_request

  private

  def authorize_request
    @path = request.original_fullpath

    if @path == '/login' || @path == '/register'
      return
    end

    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
