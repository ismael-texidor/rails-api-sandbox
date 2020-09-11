require 'rails_helper'

RSpec.describe ValidationHelper, type: :helper do
  describe "#type_check_validation" do

    let(:params) { 
      { first_name:'test', 
        last_name:'user', 
        phone_number:'numbah', 
        college_id:1, 
        exam_id:1, 
        start_time:'2020-11-28T07:32:40+09:00' } }

    it "returns true when params have valid types" do
      expect(ValidationHelper.type_check_validation(params)).to be(true)
    end

    it "returns an error when params have invalid types - string check" do
      params[:first_name] = 1
      expect { ValidationHelper.type_check_validation(params) }.to raise_error('first_name is not a String')
    end

    it "returns an error when params have invalid types - int check" do
      params[:college_id] = '1fj'
      expect { ValidationHelper.type_check_validation(params) }.to raise_error('invalid value for Integer(): "1fj"')
    end

    it "returns an error when params have invalid types - datetime check" do
      params[:start_time] = 'bad bad date'
      expect { ValidationHelper.type_check_validation(params) }.to raise_error('invalid date')
    end

  end
end
