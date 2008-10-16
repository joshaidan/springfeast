class RegistrationController < ApplicationController
  skip_before_filter :verify_authenticity_token
  #auto_complete_for :person, :first_name, :order => 'first_name DESC'
  
  def index
    @client_queue = ClientQueue.find_all_by_date(Date.today)
    @person = Person.new
    @people = Person.paginate :per_page => 10, :page => params[:page]
  end
  
  def check_eligibility
    #search to see if the person or address exists in the database
    search_str = params[:search_str]
    if !(search_str[0,1].to_i > 0) #is not a number
      @people = Person.has_name(search_str)
    else
      @people = Person.lives_at(search_str)
    end
    
    #if the person does not exist, then look up the address on the map
    if (search_str[0,1].to_i > 0)
      @map = Client.new(:address => search_str)
      @map.fetch_coordinates
    end
        
    respond_to do |format|
      format.js
    end
    
  end

  def register
    @person = Person.find(params[:id])
    
    if @person.register
      redirect_to :action => :index
    else
      flash[:notice] = "Error trying to register client.  Please contact an administrator."
      redirect_to :action => :index
    end
  end
  
  define_method("auto_complete_for_person_real_name") do   
    @items = Person.find(:all, :conditions => [ "LOWER(first_name) LIKE ?", '%' + params[:person][:real_name].downcase + '%' ], 
    :order => 'first_name DESC')
  
    render :inline => "<%= auto_complete_result @items, 'first_name' %>"
  end

end
