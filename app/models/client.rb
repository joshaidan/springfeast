class Client < ActiveRecord::Base
  has_many :people
  has_many :client_queue
  
  def register
    @queue = self.client_queue.new({:date => Date.today})
    @queue.save
  end
end
