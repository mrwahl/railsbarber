class AppointmentDecorator < Draper::Decorator
  delegate_all

# here it will add barber infront of each barber  when you view the index.html page.
def barber()
  "The barber is #{object.barber}"
end

def customer()
  "The customer is #{object.customer}"
end

#here it will add "Created by the User with ID =" for each ID field when you view the index.html page.
def appendID()
  "Created by the User with ID = #{object.user_id}"
end


def date()
  "Date of appointment is = #{object.date}"
end

end
