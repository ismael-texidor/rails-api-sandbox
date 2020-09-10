class ApplicationController < ActionController::API
  ActionController::Parameters.action_on_unpermitted_parameters = :raise
end
