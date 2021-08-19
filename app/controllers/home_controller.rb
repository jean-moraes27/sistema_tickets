# frozen_string_literal: true

# Controller de usuarios
class HomeController < ApplicationController
  before_action :authorize
  add_breadcrumb 'Inicio', :root_path
  def index
    @tickets_opened = Ticket.where(['status in (?)', [0, 1]]).count
    @tickets_attend = Ticket.where(['status = ?', 1]).count
    @tickets_closed = Ticket.where(['status = ?', 2]).count
  end
end
