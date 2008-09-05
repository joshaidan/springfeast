class ReceptionistController < ApplicationController
  def index
    @client_queue = ClientQueue.find_all_by_date(Date.today)
  end

  def send_to_interviewer
  end

end
