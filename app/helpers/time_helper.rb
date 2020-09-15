module TimeHelper  
  #------------------------------------------------
  def self.profile_block(label)
    Rails.logger.info "PROFILE: #{label} started"
    puts "PROFILE: #{label} started" if Rails.env.test?
    start = Time.now
    yield
    finish = Time.now
    diff = (finish - start)
    Rails.logger.info "PROFILE: #{label} completed in #{diff.round(2)} seconds"
    puts "PROFILE: #{label} completed in #{diff.round(2)} seconds" if Rails.env.test?
    diff
  end
end