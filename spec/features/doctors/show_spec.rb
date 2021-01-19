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

  visit doctor_path(@doctor_1)
  end

  it 'Shows attributes, hospital they work, all patients they have' do

    expect(page).to have_content("Doctor #{@doctor_1.name}")
    expect(page).to have_content("Specialty: #{@doctor_1.specialty}")
    expect(page).to have_content("Education: #{@doctor_1.university}")
    expect(page).to have_link(@hospital_1.name)
    expect(page).to have_link(@patient_1.name)
    expect(page).to have_link(@patient_2.name)
    expect(page).to_not have_link(@patient_3.name)
  end
  it 'Can remove patients' do
    expect(page).to have_button('Remove Patient')

    within("#patient-#{@patient_1.id}") do
      click_on 'Remove Patient'
    end
    expect(current_path).to eq(doctor_path(@doctor_1))
    expect(page).to_not have_content(@patient_1.name)
  end
end
