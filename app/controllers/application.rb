class Application < Merb::Controller
  before :check_mysql_connection
  
  private
  
  def check_mysql_connection
    unless Appointment.connection.active? 
      Appointment.connection.reconnect! 
    end
  end
end