# frozen_string_literal: true

# helpers que podem ser extendidos para qualquer controller
module ApplicationHelper
  def active_class(link_path)
    current_page?(link_path) ? 'active' : ''
  end

  def crd_msg(code)
    return 'Registro cadastrado com sucesso' if code == 'created'
    return 'Registro atualizado com sucesso' if code == 'updated'
    return 'Registro excluido com sucesso' if code == 'deleted'
  end
end
