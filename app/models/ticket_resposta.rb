class TicketResposta < ApplicationRecord
  validates :ticket_id, presence: { message: 'Informe o id do chamado' }
  validates :content, presence: { message: 'Informe o conteúdo da resposta' }
  self.table_name = 'tickets_respostas'

  has_one :atendente, class_name: 'User', foreign_key: 'id', primary_key: 'attendant_id'
end
