class API::ApplicationController < ApplicationController
  before_action :authenticate_user

  private

    def authenticate_user
      authenticate_with_http_token do |token|
        @current_user = User.find_by(api_key: token)
      end
    end
end