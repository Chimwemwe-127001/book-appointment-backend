# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    subject { User.new(name: 'Ritta Sweta', email: 'ritta@gmail.com', password: '123456') }
    before { subject.save }

    context 'valid' do
      it 'user to be valid' do
        expect(subject).to be_valid
      end

      it 'name of user to be valid' do
        expect(subject.name).to eq 'Ritta Sweta'
      end

      it 'email of user to be valid' do
        expect(subject.email).to eq 'ritta@gmail.com'
      end
    end

    context 'invalid' do
      it 'check the name is not blank' do
        subject.name = nil
        expect(subject).to_not be_valid
      end

      it 'check the email is not blank' do
        subject.email = nil
        expect(subject).to_not be_valid
      end
    end
  end
end
