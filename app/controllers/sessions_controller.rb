class SessionsController < ApplicationController
  layout "auth"
  def new
  end
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      sign_in(@user)
      redirect_to root_url
    else
      flash[:alert] = "Usuário ou senha inválido(s)"
      redirect_to "/sign_in"
    end
  end
  def destroy
    sign_out
    redirect_to sign_in_path, notice: "Sessão finalizada com sucesso"
  end
end
