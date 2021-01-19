class Hospital < ApplicationRecord
  has_many :doctors

  def count_doctors
    doctors.count
  end

  def list_universities
    doctors.select(:university).distinct.pluck(:university)
  end
end
