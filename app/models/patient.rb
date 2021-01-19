class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments

  def self.list_names
    order(age: :desc).pluck(:name)
  end
end
