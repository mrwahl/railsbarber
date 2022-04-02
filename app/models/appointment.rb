class Appointment < ApplicationRecord
    #relationships between models 
    belongs_to :user
    

    #data form validation
    validates :barber, presence: true
    validates :customer, presence: true
    validates :notes,length: { maximum: 500 }
    validates :date, presence: true

end
