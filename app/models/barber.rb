class Barber < ApplicationRecord
    #relationships between models 
    belongs_to :user

    has_many :appointments
    has_many :customers, through: :appointments

    #data form validation
    validates :first_name, presence: true, length: { minimum: 2 }
    validates :last_name, presence: true, length: { minimum: 2 }
    validates :age, presence: true, length: { maximum: 3 }
    validates :email, presence: true, uniqueness: true
end
