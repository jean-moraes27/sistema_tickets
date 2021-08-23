# frozen_string_literal: true

# Controller de tickets
class TicketsController < ApplicationController
  before_action :authorize

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
    @users = User.all
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @users = User.all
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to tickets_path, notice: helpers.crd_msg('created') }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: helpers.crd_msg('updated') }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    if @ticket.present?
      @ticket.destroy
    end
    redirect_to tickets_url, notice: helpers.crd_msg('deleted')
  end

  def show
    @resposta = TicketResposta.new
    @ticket = Ticket.find(params[:id])
  end

  def reply_resposta
    @parameters = ticket_reply_params
    @parameters[:attendant_id] = session[:user_id]
    @resposta = TicketResposta.new(@parameters)
    @ticket = Ticket.find(@resposta.ticket_id)
    respond_to do |format|
      if @resposta.save
        format.html { redirect_to @ticket, notice: helpers.crd_msg('updated') }
        format.json { render :show, status: :ok, location: @resposta }
      else
        # format.html { redirect_to @ticket, status: :unprocessable_entity }
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @resposta.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:attendant, :tipo, :status, :title, :status, :content)
  end

  def ticket_reply_params
    params.require(:ticket_resposta).permit(:content, :ticket_id)
  end
end
