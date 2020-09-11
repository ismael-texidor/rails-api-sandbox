require 'rails_helper'

RSpec.describe ApiHelper, type: :helper do
  describe "#log_api_request" do
    
    context 'API successful request log' do
      before :each do
        ApiHelper.log_api_request('test', {first_name:'test'}, 'ip', true)
      end

      it "returns true when request stored is successful" do
        expect(ApiRequest.first.is_successful).to be(true)
      end
    end

    context  'API failure request log' do
      before :each do
        ApiHelper.log_api_request('test', {first_name:'test'}, 'ip', false)
      end

      it "returns true when request stored is successful" do
        expect(ApiRequest.first.is_successful).to be(false)
      end
    end
  end
end