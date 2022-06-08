# TODO: Seed the database according to the following requirements:
# - There should be 10 Doctors with unique names
# - Each doctor should have 10 patients with unique names
# - Each patient should have 10 appointments (5 in the past, 5 in the future)
#   - Each appointment should be 50 minutes in duration
require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all

10.times do
    # Make 10 Doctors
    doctor = Doctor.create(
        name: Faker::Name.unique.name
    )
    10.times do
        #Make 10 Patients per Doctor
        patient = Patient.create(
            doctor_id: doctor.id,
            name: Faker::Name.unique.name
        )
        5.times do
            #Make 5 Future Appointments
            appointment = Appointment.create(
                patient_id: patient.id,
                doctor_id: patient.doctor_id,
                start_time: Faker::Date.between(from:Time.zone.now, to: 30.days.from_now),
                duration_in_minutes: 50
            )
            p appointment
        end
        5.times do
            #Make 5 Past Appointments
            appointment = Appointment.create(
                patient_id: patient.id,
                doctor_id: patient.doctor_id,
                start_time: Faker::Date.between(from: 30.days.ago, to: Time.zone.now),
                duration_in_minutes: 50
            )
            p appointment
        end
    end
end

p "Created #{Doctor.count} doctors."
p "Created #{Appointment.count} appointments."
p "Created #{Patient.count} patients."
p "Created #{doctor.patients.count} patients for doctor #{doctor.name}."
