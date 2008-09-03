class RegistrationController < ApplicationController
  def index
    @clients = Client.find(:all)
    @client_queue = ClientQueue.find_all_by_date(Date.today)
  end

  def register
    @client = Client.find(params[:id])
    
    if @client.register
      redirect_to :action => :index
    else
      flash[:notice] = "Error trying to register client.  Please contact an administrator."
      redirect_to :action => :index
    end
  end

end
