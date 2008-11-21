class Appointments < Application
  
  def index
    @appointment = Appointment.new
    render
  end

  # GET /appointments/:id
  def show
    @ok = Ok.new
    @proposed_date = ProposedDate.new
    @appointment = Appointment.find_by_id(params[:id])
    raise NotFound unless @appointment
    display @appointment
  end

  # POST /appointments
  def create
    @appointment = Appointment.new(params[:appointment])
    if @appointment.save
      redirect url(:appointment, @appointment.stub)
    else
      render :index
    end
  end

  # DELETE /appointments/:id
  def destroy
    @appointment = Appointment.find_by_id(params[:id])
    raise NotFound unless @appointment
    if @appointment.destroy
      redirect url(:appointments)
    else
      raise BadRequest
    end
  end

end