class ApplicationController < ActionController::Base
  
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]
  protect_from_forgery
end
