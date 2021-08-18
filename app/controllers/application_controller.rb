# frozen_string_literal: true

# Controller da aplicacao
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def authorize
    redirect_to '/sign_in' unless logged_in?
  end
end
