require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  Devise::Test::IntegrationHelpers
  test 'invalid barber' do
    customer = Customer.new(first_name:'John',last_name:'Duff',age:31,email:'thebestemail@gmail.com',user_id:10)
    assert_not customer.valid?
  end


  test 'invalid without name' do

    customer = Customer.new(last_name:'Duff',age:31,email:'thebestemail@gmail.com',user_id:1)
    assert_not customer.valid?
  end


  test 'invalid without email' do

    customer = Customer.new(first_name:'John',last_name:'Duff',age:31,user_id:10)
    assert_not customer.valid?
  end

  test 'invalid age' do

    customer = Customer.new(first_name:'John',last_name:'Duff',age:3221,user_id:10)
    assert_not customer.valid?
  end
end
