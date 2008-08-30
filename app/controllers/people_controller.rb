class PeopleController < ApplicationController
  def new
    @client = Client.find(params[:client_id])
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def create
    @client = Client.find(params[:client_id])
    @person = @client.people.new(params[:person])
    if @person.save
      flash[:notice] = "#{@person.first_name} has been saved."
      redirect_to @client
    else
      flash[:notice] = "An error has occurred trying to save #{@person.first_name}."
      redirect_to new_client_person_path(@client)
    end
  end

end
