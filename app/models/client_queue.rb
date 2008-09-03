class ClientQueue < ActiveRecord::Base
  belongs_to :client

  def Queue.current_queue
    self.find_by_date(Date.today)
  end

end
