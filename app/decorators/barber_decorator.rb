
class BarberDecorator < Draper::Decorator
  delegate_all

  # here it will add Barber infront of each barbers first name when you view the index.html page.
  def barber()
    "Barber #{object.first_name}"
  end
  
  def age()
    "Barbers age is #{object.age}"
  end

  #here it will add "Created by the User with ID =" for each ID field when you view the index.html page.
  def appendID()
    "Created by the User with ID = #{object.user_id}"
  end
end
