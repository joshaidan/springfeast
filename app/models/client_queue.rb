class ClientQueue < ActiveRecord::Base
  belongs_to :client
  
  named_scope :current_queue, lambda { {:conditions => ["date > ?", Date.today]} }

end
