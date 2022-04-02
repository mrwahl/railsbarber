require "test_helper"

class BarberTest < ActiveSupport::TestCase
  Devise::Test::IntegrationHelpers
  test 'invalid barber' do
    barber = Barber.new(first_name:'John',last_name:'Duff',age:31,email:'thebestemail@gmail.com',user_id:10)
    assert_not barber.valid?
  end


  test 'invalid without name' do

    barber = Barber.new(last_name:'Duff',age:31,email:'thebestemail@gmail.com',user_id:1)
    assert_not barber.valid?
  end


  test 'invalid without email' do

    barber = Barber.new(first_name:'John',last_name:'Duff',age:31,user_id:10)
    assert_not barber.valid?
  end

  test 'invalid age' do

    barber = Barber.new(first_name:'John',last_name:'Duff',age:3221,user_id:10)
    assert_not barber.valid?
  end

end
