require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'relationships' do
    it { should have_many :doctors }
  end
  describe 'instance methods' do
    before :each do
    @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
    @hospital_2 = Hospital.create!(name: 'Seaside Health & Wellness Center')
    @doctor_1 = @hospital_1.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
    @doctor_2 = @hospital_1.doctors.create!(name: 'Alex Karev', specialty: 'Perdiatric Surgery', university: 'Harvard University')
    @doctor_3 = @hospital_2.doctors.create!(name: 'Miranda Bailey', specialty: 'General Survery', university: 'Stanford University')
    @patient_1 = Patient.create!(name: 'Katie Bryce', age: 24)
    @patient_2 = Patient.create!(name: 'Denny Duquette', age: 39)
    @patient_3 = Patient.create!(name: 'Rebecca Pope', age: 32)
    @patient_4 = Patient.create!(name: 'Zola Shepherd', age: 2)
    Appointment.create!(doctor_id: @doctor_1.id, patient_id: @patient_1.id)
    Appointment.create!(doctor_id: @doctor_2.id, patient_id: @patient_1.id)
    Appointment.create!(doctor_id: @doctor_1.id, patient_id: @patient_2.id)
    Appointment.create!(doctor_id: @doctor_3.id, patient_id: @patient_3.id)
    end
    it 'counts doctors' do
      expect(@hospital_1.count_doctors).to eq(2)
    end
    it 'list universities' do
      expect(@hospital_1.list_universities).to eq(['Harvard University'])
    end
  end
end
