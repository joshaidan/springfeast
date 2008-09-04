class QueueController < ApplicationController
  def index
  end

  def show
  end

  def destroy
    @queue = ClientQueue.find(params[:id])
    @queue.destroy
    redirect_to client_registration_path()
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
  end

end
