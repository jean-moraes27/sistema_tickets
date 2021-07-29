class HomeController < ApplicationController
  before_action :authorize
  add_breadcrumb "Inicio", :root_path
  def index
  end
end
