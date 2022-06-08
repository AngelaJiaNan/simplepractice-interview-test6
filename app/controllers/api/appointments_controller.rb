class Api::AppointmentsController < ApplicationController
  def index
    if params[:past] != "0" && params[:past] != "1"
      render json: {status: "error", code: 422, message: "Query parameters can only equal 0 and 1."}
    elsif params[:past] == "1"
      appointments = Appointment.where("start_time < ?", Time.zone.now)
    elsif params[:past] == "0"
      appointments = Appointment.where("start_time > ?", Time.zone.now)
    elsif params[:page] > 0 && params[:length] > 0
      offset = params[:page] - 1 * params[:length]
      appointments = Appointment.offset(offset).limit(params[:length])
    else
      appointments = Appointment.all
    end
      # appointments.each do |a|
      #   appointments.push({
      #     id: a.id,
      #     patient: { name: a.patient.name },
      #     doctor: { name: a.doctor.name, id: a.doctor.id },
      #     created_at: a.created_at,
      #     start_time: a.start_time,
      #     duration_in_minutes: a.duration_in_minutes
      #   })
      # end
    render json: appointments
  end

  def create
    appointment = Appointment.new(
      patient_id: Patient.where(name: params[:patient][:name]),
      doctor_id: params[:doctor][:id],
      duration_in_minutes: params[:duration_in_minutes],
      start_time: params[:start_time]
    )
  end
end
