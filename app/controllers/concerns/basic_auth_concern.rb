module BasicAuthConcern 
  extend ActiveSupport::Concern
  included do
    before_action :http_authenticate
  end
  
  def http_authenticate
    p ENV["ADMIN_USERNAME"]
    # http_basic_authenticate_or_request_with(name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD'])
  end
end
