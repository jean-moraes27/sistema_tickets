# frozen_string_literal: true

# Controller de usuarios
class HomeController < ApplicationController
  before_action :authorize
  add_breadcrumb 'Inicio', :root_path
  def index
    @tickets_opened = Ticket.where(['status in (?)', [0, 1]]).count('id')
    @tickets_attend = Ticket.where(['status = ?', 1]).count('id')
    @tickets_closed = Ticket.where(['status = ?', 2]).count('id')
    @tickets_mes = Ticket.select('
      extract(month from created_at) as mes, count(id) as total').group('mes')

    @por_mes = []

    for i in 1..12
      @faturou = false
      @tickets_mes.each do |item|
        if item.mes == i
          @faturou = true
        end
        if @faturou
          @por_mes.push(item.total)
        end
      end
      if !@faturou
        @por_mes.push(0)
      end
    end
    @chart_legendas = [
      'Janeiro',
      'Fevereiro',
      'Março',
      'Abril',
      'Maio',
      'Junho',
      'Julho',
      'Agosto',
      'Setembro',
      'Outubro',
      'Novembro',
      'Dezembro',
    ]
    @chart_data = [
      10,
      20,
      15,
      13,
      18,
      28,
    ]
  end
end
