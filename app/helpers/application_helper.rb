# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def header_menu
    render :inline => "<%= link_to 'Eligibility', client_registration_path %> <%= link_to 'Reception', receptionist_path %> <%= link_to 'Interview', interviewer_path %>"
  end
end
