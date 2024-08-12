class ApplicationController < ActionController::Base
  skip_forgery_protection
  require "http"
  require "json"
end
