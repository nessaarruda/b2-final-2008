class AppointmentsController < ApplicationController

  def destroy
    Appointment.find(params[:format]).destroy
    redirect_to doctor_path(params[:id])
  end
end
