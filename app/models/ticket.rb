# frozen_string_literal: true

# model de ticket
class Ticket < ApplicationRecord
  validates :title, presence: true, presence: { message: 'Informe o título do chamado' }
  validates :tipo, presence: true, presence: { message: 'Informe o tipo do chamado' }
  validates :attendant, presence: true, presence: { message: 'Informe o responsável pelo chamado' }
  validates :content, presence: true, presence: { message: 'Informe o conteúdo do chamado' }

  has_one :atendente, class_name: 'User', foreign_key: 'id', primary_key: 'attendant'
end
