# frozen_string_literal: true

# Controller de usuarios
class UsersController < ApplicationController
  before_action :authorize
  add_breadcrumb 'Inicio', :root_path
  add_breadcrumb 'Usuários', :users_path
  def index
    @page_title = 'Usuários'
    @users = User.all
  end

  def new
    add_breadcrumb 'Novo usuário', :new_user_path
    @page_title = 'Novo usuário'
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'Usuário foi criado com sucesso!'
      # sign_in(@user)
    else
      render action: :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'Usuário excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
