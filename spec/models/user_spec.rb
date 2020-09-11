require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#new_record' do

    before :each do
      user = User.new({first_name: 'test', last_name: 'user', phone_number: 'number'})
      user.save 
    end

    it 'should exist as a public class method' do
      expect(User.first.public_methods).to include(:find_user)
    end
    
    it 'should verify a user exists' do
      result = User.first.find_user('test', 'user', 'number')
      expect(result).to be(true)
    end
  end
end
