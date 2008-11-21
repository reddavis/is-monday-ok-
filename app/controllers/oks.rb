class Oks < Application
  
  def create
    if params[:appointment]
      data = Appointment.find_by_stub(params[:appointment])
      appointment = data
    elsif params[:proposed_date]
      puts data = ProposedDate.find(params[:proposed_date])
      appointment = data.appointment
    end
    data.oks.build(params[:ok])
    if data.save
      redirect url(:controller => :appointments, :action => :show, :id => appointment, :message => "Saved")
    else
      redirect url(:controller => :appointments, :action => :show, :id => appointment, :message => "Uh Oh, we need your name.")
    end
  end
  
  def show
    if params[:appointment]
      @data = Appointment.find_by_stub(params[:appointment])
      @appointment = @data
    elsif params[:proposed_date]
      @data = ProposedDate.find(params[:proposed_date])
      @appointment = @data.appointment
    end
    display @data
  end

end
