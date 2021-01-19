require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
  it { should have_many :appointments }
  it { should have_many(:doctors).through(:appointments) }
  end
  describe 'class methods' do
    before :each do
      @patient_1 = Patient.create!(name: 'Katie Bryce', age: 24)
      @patient_2 = Patient.create!(name: 'Denny Duquette', age: 39)
      @patient_3 = Patient.create!(name: 'Rebecca Pope', age: 32)
      @patient_4 = Patient.create!(name: 'Zola Shepherd', age: 2)
    end
    it 'list name by age desc' do
    expect(Patient.list_names).to eq([@patient_2.name, @patient_3.name, @patient_1.name, @patient_4.name])
    end
  end
end
