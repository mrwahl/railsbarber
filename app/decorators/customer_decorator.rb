class CustomerDecorator < Draper::Decorator
  delegate_all

# here it will add Customer infront of each customers first name when you view the index.html page.
def customer()
  "Customer #{object.first_name}"
end

def age()
  "Customers age is #{object.age}"
end

#here it will add "Created by the User with ID =" for each ID field when you view the index.html page.
def appendID()
  "Created by the User with ID = #{object.user_id}"
end


end
