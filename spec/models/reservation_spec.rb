# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'Reservation model' do
    user = User.create(name: 'Ritta Sweta', email: 'ritta@example.com', password: '123456')
    doctor = Doctor.new(
      name: 'Dr. Martin',
      details: 'In the past 20 years I have been a doctor for the heart',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      city: 'Delhi, India',
      specialization: 'Carthodologist',
      cost: 235
    )
    subject { Reservation.new(user_id: user, doctor_id: doctor, city: 'Delhi,India', date: '08-09-2022') }
    before { subject.save }

    it 'check the city is not blank' do
      subject.city = nil
      expect(subject).to_not be_valid
    end

    it 'check if the city is not exceeding 50 characters' do
      subject.city = 'Hello world Hello world Hello world Hello world Hello world Hello world'
      expect(subject).to_not be_valid
    end

    it 'check the date is not blank' do
      subject.date = nil
      expect(subject).to_not be_valid
    end

    it 'check if the date is not exceeding 20 characters' do
      subject.date = 'Hello world Hello world Hello world Hello world'
      expect(subject).to_not be_valid
    end
  end
end
