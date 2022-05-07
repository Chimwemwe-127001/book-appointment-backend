# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'Doctor model' do
    user = User.create(name: 'Ritta Sweta', email: 'ritta@gmail.com', password: '123456')
    subject { Doctor.new(
      user_id: user, 
      name: 'Dr. Martin', 
      details: 'In the past 20 years I have been a doctor for the heart', 
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo', 
      city: 'Delhi, India', 
      specialization: 'Carthodologist', 
      cost: 235) }
    before { subject.save }

    it 'check the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'check if the name is not exceeding 50 characters' do
      subject.name = 'Hello world Hello world Hello world Hello world Hello world Hello world'
      expect(subject).to_not be_valid
    end

    it 'check the details is not blank' do
      subject.details = nil
      expect(subject).to_not be_valid
    end

    it 'check if the name is not exceeding 500 characters' do
      subject.details = 'Hello world Hello world Hello world Hello world Hello world Hello world
      Hello world Hello world Hello world Hello world Hello world Hello world
      Hello world Hello world Hello world Hello world Hello world Hello world
      Hello world Hello world Hello world Hello world Hello world Hello world
      Hello world Hello world Hello world Hello world Hello world Hello world
      Hello world Hello world Hello world Hello world Hello world Hello world
      Hello world Hello world Hello world Hello world Hello world Hello world
      Hello world Hello world Hello world Hello world Hello world Hello world
      Hello world Hello world Hello world Hello world Hello world Hello world'
      expect(subject).to_not be_valid
    end

    it 'check the photo is not blank' do
      subject.photo = nil
      expect(subject).to_not be_valid
    end

    it 'check the cost is not blank' do
      subject.cost = nil
      expect(subject).to_not be_valid
    end

    it 'check if cost is numeric' do
      subject.cost = 'not-numeric'
      expect(subject).to_not be_valid
    end

    it 'check if cost is equal or greater than one' do
      expect(subject.cost).to be >= 1
    end
  end
end
