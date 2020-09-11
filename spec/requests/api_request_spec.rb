require 'rails_helper'

RSpec.describe "Apis", type: :request do

  let(:valid_params) { 
    { "api"=> { "first_name"=>"ish", 
      "last_name"=>"test", 
      "phone_number"=>"number", 
      "college_id"=>1, 
      "exam_id"=>1, 
      "start_time"=>"2020-11-28T07:32:40+09:00" } }
  }

  describe "Get test_check" do

    context "with valid parameters but no data" do
      it "returns 400 if any of the models are missing" do
          get '/test_checker/', params: valid_params
        expect(response).to have_http_status(:bad_request)
        expect(response.body).to include("Document(s) not found for class College")
      end
    end

    context "with valid parameters but partial data" do
      before :each do
        college = College.new({name:'Test College'})
        college.save
      end
      it "returns 400 if any of the models are missing" do
          get '/test_checker/', params: valid_params
          
        expect(response).to have_http_status(:bad_request)
        expect(response.body).to include("exam_id not found")
      end
    end
  end
end
