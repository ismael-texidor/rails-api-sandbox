class ApiController < ApplicationController
  before_action :validate, only: [:show]
  after_action :log_successful_request, if: -> { response.successful? }
  after_action :log_failed_request, unless: -> { response.successful? }

  # GET /test_checker/
  def show
    begin
      # Params have been validated let's assign them to variables.
      permitted_params = params[:api]
      first_name = permitted_params[:first_name].strip
      last_name = permitted_params[:last_name].strip
      phone_number = permitted_params[:phone_number].strip
      college_id = permitted_params[:college_id]
      exam_id = permitted_params[:exam_id]
      start_time = ValidationHelper.parse_date(permitted_params[:start_time])

      # check for valid college.
      college = College.find(college_id)
      
      # check that the exam_id exists inside this college.
      exam = college.exams.select { |exam| exam.exam_id == exam_id }.first
      raise 'exam_id not found' if exam.nil?
      
      # check that the user exist in the exam. 
      user = exam.users.select { |user| user.find_user(first_name, last_name, phone_number) }.any?
      # If the user doesn't exist, create it and add to the exam. 
      unless user
        add_user = User.new({ first_name: first_name, last_name: last_name, phone_number: phone_number })
        add_user.save
        exam.users << add_user
        exam.save
      end

      # check that the start_time falls withint the exam_window.
      exam_window = exam.exam_windows.select { |exam_window| start_time.between?(exam_window.start_time, exam_window.end_time) }.any?
      raise 'start_time is outside the exam window' unless exam_window
      
      render json:'Success'.to_json, status: :ok
    rescue Exception => error
      @error = error
      render json:error.to_json, status: :bad_request
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def validate
      begin
        headers['Last-Modified'] = Time.now.httpdate
        permitted = params.require(:api).permit(:first_name, :last_name, :phone_number, :college_id, :exam_id, :start_time)
        ValidationHelper.type_check_validation(permitted)
      rescue Exception => error
        @error = error
        render json:error.to_json, status: :bad_request
      end
    end

    def log_successful_request
      ApiHelper.log_api_request('test_checker', params[:api], request.remote_ip, true)
    end

    def log_failed_request
      ApiHelper.log_api_request('test_checker', params[:api], request.remote_ip, false, @error)
    end
end