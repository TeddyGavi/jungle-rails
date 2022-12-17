module BasicAuthConcern 
  extend ActiveSupport::Concern
  included do
    before_action :http_authenticate
  end
  
  def http_authenticate
    http_basic_authenticate_or_request_with name: ENV['ADMIN_USERNAME'].to_s, password: ENV['ADMIN_PASSWORD'].to_s
  end
end
