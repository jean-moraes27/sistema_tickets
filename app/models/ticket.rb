class Ticket < ApplicationRecord
    validates :title, presence: true, presence:{ message: 'Informe o título do chamado' }
    validates :content, presence: true, presence:{ message: 'Informe o conteúdo do chamado' }
end
