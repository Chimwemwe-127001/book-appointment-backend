# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'Reservation model' do
    user = User.create!(name: 'Ritta Sweta', email: 'ritta11@example.com', password: '123456')
    doctor = Doctor.create!(
      name: 'Dr. Martin',
      details: 'In the past 20 years I have been a doctor for the heart',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      city: 'Delhi, India',
      specialization: 'Carthodologist',
      cost: 235
    )
    subject { Reservation.new(user_id: user.id, doctor_id: doctor.id, city: 'Delhi,India', date: '08-09-2022') }
    before { subject.save! }

    context 'valid' do
      it 'reservation to be valid' do
        expect(subject).to be_valid
      end

      it 'city to be valid' do
        expect(subject.city).to eq 'Delhi,India'
      end

      it 'date to be valid' do
        expect(subject.date).to eq '08-09-2022'
      end
    end

    context 'invalid' do
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
end
