class ClientQueue < ActiveRecord::Base
  belongs_to :person
  
  named_scope :current_queue, lambda { {:conditions => ["date > ?", Date.today]} }
  
  def send_to_interviewer
    self.state = 2
    self.save!
  end
end
