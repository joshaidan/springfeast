class RegistrationController < ApplicationController
  skip_before_filter :verify_authenticity_token
  #auto_complete_for :person, :first_name, :order => 'first_name DESC'
  
  def index
    @client_queue = ClientQueue.find_all_by_date(Date.today)
    @person = Person.new
    @people = Person.paginate :per_page => 10, :page => params[:page]
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
  
  define_method("auto_complete_for_person_real_name") do   
    @items = Person.find(:all, :conditions => [ "LOWER(first_name) LIKE ?", '%' + params[:person][:real_name].downcase + '%' ], 
    :order => 'first_name DESC')
  
    render :inline => "<%= auto_complete_result @items, 'first_name' %>"
  end

end
