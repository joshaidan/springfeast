# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def header_menu
    render :inline => "<%= link_to 'Regisration', client_registration_path %> <%= link_to 'Reception', receptionist_path %> <%= link_to 'Interview', interviewer_path %> <%= link_to 'Food Checkout', check_out_path %>"
  end
end
