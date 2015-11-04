class UsersController < ApplicationController
  include UserHelper
  
  def dashboard
    @booths = Booth.where(user_id: current_user)
  end
end