require 'rails_helper'

describe 'As a visitor when I visit the show page' do
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

  visit hospital_path(@hospital_1)
  end

  it 'Shows attributes, hospital they work, all patients they have' do

    expect(page).to have_content(@hospital_1.name)
    expect(page).to have_content(@hospital_1.count_doctors)
    expect(page).to have_content(@hospital_1.list_universities)
  end
end
