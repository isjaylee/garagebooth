class UsersController < ApplicationController
  include UserHelper
  
  def dashboard
    @garages = Garage.where(user_id: current_user)
  end
end