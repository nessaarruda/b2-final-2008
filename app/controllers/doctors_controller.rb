class DoctorsController < ApplicationController
  before_action :find_doctor

  def index
    @doctors = Doctor.all
  end

  def show
    @patients = @doctor.patients
    @hospital = @doctor.hospital
  end

private
  def find_doctor
    @doctor = Doctor.find(params[:id])
  end
end
