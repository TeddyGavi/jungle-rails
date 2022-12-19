module BasicAuthConcern 
  extend ActiveSupport::Concern
  
  included do
    before_action :http_authenticate
  end
  
  def http_authenticate
    username = ENV['ADMIN_USERNAME']
    password = ENV['ADMIN_PASSWORD']
    
    http_basic_authenticate_or_request_with(name: username, password: password)
  end
end
