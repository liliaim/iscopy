class UsersController < ApplicationController
  before_action :move_to_index

  def show
    @nickname = current_user.nickname
    @user = User.find(params[:id])
    @plans = @user.plans
    @records = @user.records
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
