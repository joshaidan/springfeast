class Person < ActiveRecord::Base
  belongs_to :client
  
  def real_name
    first_name = read_attribute(:first_name)
    last_name = read_attribute(:last_name)
    if first_name and last_name
      name = first_name.to_s + ' ' + last_name.to_s
    else
      ""
    end
  end
end
