class Person < ActiveRecord::Base
  belongs_to :client
  has_many :client_queues
  
  named_scope :has_name, lambda { |name| {:conditions => ["first_name = ? or last_name = ?", name, name]} }
  named_scope :lives_at, lambda { |address| {:include => :client, :conditions => ["clients.address = ?", address]}}
  
  def Person.find_person(name)
    find(:all, :conditions => ["fist_name = ? or last_name = ?", name, name])
  end
  
  def real_name
    first_name = read_attribute(:first_name)
    last_name = read_attribute(:last_name)
    if first_name and last_name
      name = first_name.to_s + ' ' + last_name.to_s
    else
      ""
    end
  end
  
  def register
    @queue = self.client_queues.new({:date => Date.today})
    @queue.save
  end
end
