# frozen_string_literal: true

# Controller de usuarios
class HomeController < ApplicationController
  before_action :authorize
  add_breadcrumb 'Inicio', :root_path
  def index
    @tickets_opened = Ticket.where(['type = ? and status = ?', 1, 0]).count
    @tickets_closed = Ticket.where(['type = ? and status = ?', 2, 0]).count
    @tickets_attend = Ticket.where(['type = ? and status = ?', 3, 0]).count
  end
end
