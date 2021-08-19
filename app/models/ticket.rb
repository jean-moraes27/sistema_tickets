class Ticket < ApplicationRecord
    validates :title, presence: true, presence:{ message: 'Informe o título do chamado' }
    validates :content, presence: true, presence:{ message: 'Informe o conteúdo do chamado' }

    has_one :atendente, :class_name => "User",  :foreign_key => 'id', :primary_key => 'attendant'
end
