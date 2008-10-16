class Client < ActiveRecord::Base
  has_many :people
  has_many :client_queue
  
  named_scope :address, lambda {|address| {:conditions => ["address = ?", address]}}
  
  def fetch_coordinates
     address = "#{self.address}, Thunder Bay, Ontario, Canada".gsub(' ', '+')
     @xml = Net::HTTP.get URI.parse("http://maps.google.com/maps/geo?q=#{address}e&output=xml&key=ABQIAAAAWeEzTbVVHIF6pbi5GNENxhSb_Ev2LQXzIrd-RzaQx8RqhNSYiRQ6BXq0qmVWB-E3yUYSeJJt4GkJOQ")
     res = XmlSimple.xml_in(@xml)
     coordinates = res['Response'][0]['Placemark'][0]['Point'][0]['coordinates'][0].split(',')
     self.longitude = coordinates[0]
     self.latitude = coordinates[1]
   end
end
