class ClientQueue < ActiveRecord::Base
  belongs_to :person
  
  named_scope :current_queue, lambda { {:conditions => ["date > ?", Date.today]} }

end
