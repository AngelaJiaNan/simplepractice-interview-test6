class AppointmentSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :doctor
  belongs_to :patient
end 
