class Api::AppointmentsController < ApplicationController
  def index

    @appointments = []

    if params[:past] != "0" && params[:past] != "1"
      render json: {status: "error", code: 422, message: "Query parameters can only equal 0 and 1."}
    elsif params[:past] == "1"
      appointments = Appointment.where("start_time < ?", Time.zone.now)
    elsif params[:past] == "0"
      appointments = Appointment.where("start_time > ?", Time.zone.now)
    elsif params[:page] > 0 && params[:length] > 0
      offset = params[:page] - 1 * params[:length]
      p "Offset is #{offset}"
      appointments = Appointment.offset(offset).limit(params[:length])
    else
      appointments = Appointment.all
    end
      appointments.each do |a|
        appointments.push({
          id: a.id,
          patient: { name: a.patient.name },
          doctor: { name: a.doctor.name, id: a.doctor.id },
          created_at: a.created_at,
          start_time: a.start_time,
          duration_in_minutes: a.duration_in_minutes
        })
      end
      render json: appointments
  end

  def create


  end
end
