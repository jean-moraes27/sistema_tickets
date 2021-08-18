# frozen_string_literal: true

# Controller de sessoes de login
class SessionsController < ApplicationController
  layout 'auth'
  def create
    @user = User.where(['email=? and active=?', getemail, true]).first
    if @user
      if @user.authenticate(params[:session][:password])
        sign_in(@user)
        redirect_to root_url
      else
        flash[:alert] = 'Usuário ou senha inválido(s)'
        redirect_to '/sign_in'
      end
    else
      flash[:alert] = 'Conta inexistente ou desativada!'
      redirect_to '/sign_in'
    end
  end

  def destroy
    sign_out
    redirect_to sign_in_path, notice: 'Sessão finalizada com sucesso'
  end

  private

  def getemail
    params[:session][:email].downcase
  end
end
