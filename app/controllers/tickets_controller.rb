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
    @ticket = Ticket.find(params[:id])
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:attendant, :tipo, :status, :title, :status, :content)
  end
end
