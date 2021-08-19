# frozen_string_literal: true

# model de ticket
class Ticket < ApplicationRecord
  validates :title, presence: { message: 'Informe o título do chamado' }
  validates :tipo, presence: { message: 'Informe o tipo do chamado' }
  validates :attendant, presence: { message: 'Informe o responsável pelo chamado' }
  validates :content, presence: { message: 'Informe o conteúdo do chamado' }

  has_one :atendente, class_name: 'User', foreign_key: 'id', primary_key: 'attendant'
end
