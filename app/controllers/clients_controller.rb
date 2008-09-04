class ClientsController < ApplicationController
  def index
    @clients = Client.paginate :per_page => 3, :page => params[:page]
    @search = Client.new
  end
  
  def find
    
  end
  
  def edit
    @client = Client.find(params[:id])
  end
  
  def new
    @client = Client.new
  end
  
  def update
    @client = Client.find(params[:id])
    respond_to do |format|
      if @client.update_attributes(params[:client])
        flash[:notice] = 'Client was successfully updated.'
        format.html { redirect_to(@client) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    
  end
  
  def show
    @client = Client.find(params[:id])
    @people = @client.people.find(:all)
  end
  
  def create
    @client = Client.new(params[:client])
    
    if @client.save
      flash[:notice] = "#{@client.address} has been saved."
      redirect_to @client
    else
      flash[:notice] = "An error has occurred trying to save #{@client.address}."
      redirect_to new_client_path(@client)
    end
  end
end
