# class Api::V1::BaseController < ApplicationController
class Api::V1::BaseController < ActionController::Base
  resource_description do
    api_version "v1"
    formats ['json']
    error code: 401, desc: "Unauthorized"
    error code: 404, desc: "Not found"
  end

  def current_account
    current_user.account
  end
  helper_method :current_account
end
