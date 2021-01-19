require 'rails_helper'

describe 'As a visitor when I visit the index page' do
  before :each do
  @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
  @hospital_2 = Hospital.create!(name: 'Seaside Health & Wellness Center')
  @doctor_1 = @hospital_1.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
  @doctor_2 = @hospital_1.doctors.create!(name: 'Alex Karev', specialty: 'Perdiatric Surgery', university: 'John Hopkings University')
  @doctor_3 = @hospital_2.doctors.create!(name: 'Miranda Bailey', specialty: 'General Survery', university: 'Stanford University')
  @patient_1 = Patient.create!(name: 'Katie Bryce', age: 24)
  @patient_2 = Patient.create!(name: 'Denny Duquette', age: 39)
  @patient_3 = Patient.create!(name: 'Rebecca Pope', age: 32)
  @patient_4 = Patient.create!(name: 'Zola Shepherd', age: 2)
  Appointment.create!(doctor_id: @doctor_1.id, patient_id: @patient_1.id)
  Appointment.create!(doctor_id: @doctor_2.id, patient_id: @patient_1.id)
  Appointment.create!(doctor_id: @doctor_1.id, patient_id: @patient_2.id)
  Appointment.create!(doctor_id: @doctor_3.id, patient_id: @patient_3.id)

  visit patients_path
  end
  it 'List patients from olderst to youngest' do
    expect(@patient_2.name).to appear_before(@patient_3.name)
    expect(@patient_3.name).to appear_before(@patient_1.name)
    expect(@patient_1.name).to appear_before(@patient_4.name)
  end
end
