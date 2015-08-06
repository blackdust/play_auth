module PlayAuth
  class ApplicationController < ActionController::Base
    layout "play_auth/application"
    include PlayAuth::SessionsHelper
  end
end

