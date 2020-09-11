module ValidationHelper
  def self.type_check_validation(params)
    raise 'first_name is not a String' unless params[:first_name].is_a? String
    raise 'last_name is not a String' unless params[:last_name].is_a? String
    raise 'phone_number is not a String' unless params[:phone_number].is_a? String
    Integer(params[:college_id])
    Integer(params[:exam_id])
    parse_date(params[:start_time])
    true
  end

  def self.parse_date(date)
    DateTime.strptime(date, "%Y-%m-%dT%H:%M:%S%z")
  end
end