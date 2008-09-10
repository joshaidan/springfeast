class InterviewerController < ApplicationController
  def index
    @client_queue = ClientQueue.find(:all, :conditions => "state = 2")
  end
  
  def interview
  end

  def send_to_foodcheckout
  end

end
