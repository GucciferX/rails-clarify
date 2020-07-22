class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :coach_record
  has_one :patient_record

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
end
