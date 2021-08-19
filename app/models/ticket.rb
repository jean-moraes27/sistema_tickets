# frozen_string_literal: true

# model de ticket
class Ticket < ApplicationRecord
  validates :title, presence: true, message: 'Informe o título do chamado'
  validates :attendant, presence: true, message: 'Informe o responsável pelo chamado'
  validates :content, presence: true, message: 'Informe o conteúdo do chamado'

  has_one :atendente, class_name: 'User', foreign_key: 'id', primary_key: 'attendant'
end
