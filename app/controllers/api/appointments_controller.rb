class Api::AppointmentsController < ApplicationController
  def index

    @appointments = []

    if params[:past] == "1"
      appointments = Appointment.where("start_time < ?", Time.zone.now)
    elsif params[:past] == "0"
      appointments = Appointment.where("start_time > ?", Time.zone.now)
    elsif params[:page] && params[:length]
      offset = params[:page] - 1 * params[:length]
      appointments = Appointment.offset(offset).limit(params[:length])
    else
      appointments = Appointment.all
    end
    appointments.each do |a|
        @appointments.push({
          id: a.id,
          patient: { name: a.patient.name },
          doctor: { name: a.doctor.name, id: a.doctor.id },
          created_at: a.created_at,
          start_time: a.start_time,
          duration_in_minutes: a.duration_in_minutes
        })
    end

    render json: @appointments
    # render json: AppointmentSerializer.new(appointments)
  end

  def create
    appointment = Appointment.new(
      patient_id: Patient.where(name: params[:patient][:name]),
      doctor_id: params[:doctor][:id],
      duration_in_minutes: params[:duration_in_minutes],
      start_time: params[:start_time]
    )

    if appointment.save!
      render json: appointment, status: created
    else
      render json: appointment.errors.full_messages
  end
end
