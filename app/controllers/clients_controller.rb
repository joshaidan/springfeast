class ClientsController < ApplicationController
  def index
    @clients = Client.find(:all)
  end
  
  def edit
    
  end
  
  def new
    @client = Client.new
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  def show
    @client = Client.find(params[:id])
  end
  
  def create
    @client = Client.new(params[:client])
    
    if @client.save
      flash[:notice] = "#{@client.address} has been saved."
      redirect_to client_path()
    else
      flash[:notice] = "An error has occurred trying to save #{@client.address}."
      redirect_to new_client_path(@client)
    end
  end
end
