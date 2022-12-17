class Admin::BaseController < ApplicationController
  include BasicAuthConcern
  # http_basic_authenticate_with name: ENV['ADMIN_USERNAME'].to_s, password: ENV['ADMIN_PASSWORD'].to_s
end