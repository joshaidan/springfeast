class Client < ActiveRecord::Base
  has_many :people
  has_many :client_queue
  
end
