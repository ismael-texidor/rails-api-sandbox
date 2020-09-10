class ApiController < ApplicationController
  before_action :validate, only: [:show]

  # GET /test/
  def show
    render json:'Success'.to_json, status: :ok
  end

  private

    # Only allow a trusted parameter "white list" through.
    def validate
      begin
        headers['Last-Modified'] = Time.now.httpdate
        params.require(:api).permit(:first_name, :last_name, :phone_number, :college_id, :exam_id, :start_time)


      rescue Exception => error
        render json:error.to_json, status: :bad_request
      end
    end
end