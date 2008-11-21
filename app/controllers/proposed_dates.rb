class ProposedDates < Application

  def create
    appointment = Appointment.find_by_stub(params[:appointment])
    appointment.proposed_dates.build(params[:proposed_date])
    if appointment.save
      redirect url(:controller => :appointments, :action => :show, :id => params[:appointment], :message => "Saved")
    else
      redirect url(:controller => :appointments, :action => :show, :id => params[:appointment], :message => "Uh oh, you didn't fill the information in properly")
    end
  end

end
