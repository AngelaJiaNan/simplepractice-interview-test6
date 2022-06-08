class Api::DoctorsController < ApplicationController
  def index
    # returns all doctors that do not have an appointment
    doctos = Doctor.where.not(id: Appointment.all.map(&:doctor_id))

    render json: doctors
  end
end
