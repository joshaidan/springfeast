class ReceptionistController < ApplicationController
  def index
    @client_queue = ClientQueue.find_all_by_date(Date.today, :conditions => "state = 1")
  end

  def send_to_interviewer
    if params[:id]
      @client_queue  = ClientQueue.find(params[:id])
    end
    redirect_to receptionist_path()
  end

end
