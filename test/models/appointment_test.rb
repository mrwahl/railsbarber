require "test_helper"

class AppointmentTest < ActiveSupport::TestCase
  Devise::Test::IntegrationHelpers
  test 'invalid appointment' do
    appointment = Appointment.new(barber:'John',customer:'Duff',notes:'hello',date:'2022-03-31 16:58:00 UTC')
    assert_not appointment.valid?
  end


  test 'invalid without barber' do

    appointment = Appointment.new(customer:'Duff',notes:'hello',date:'2022-03-31 16:58:00 UTC')
    assert_not appointment.valid?
  end


  test 'invalid without notes' do

    appointment = Appointment.new(barber:'John',customer:'Duff',date:'2022-03-31 16:58:00 UTC')
    assert_not appointment.valid?
  end

  test 'invalid notes' do

    appointment = Appointment.new(barber:'John',customer:'Duff',notes:'hello',date:'2022-03-31 16:58:00 UTC')
    assert_not appointment.valid?
  end
end
