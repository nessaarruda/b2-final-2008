class HospitalsController < ApplicationController
  before_action :find_hospital

  def index
    @hospitals = Hospital.all
  end

  def show
  end

private
  def find_hospital
    @hospital = Hospital.find(params[:id])
  end
end
