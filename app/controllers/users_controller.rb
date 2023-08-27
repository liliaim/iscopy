class UsersController < ApplicationController
  before_action :move_to_index

  def show
    @nickname = current_user.nickname
    @user = User.find(params[:id])
    @plans = @user.plans
    @records = @user.records
    pref = []
    @plans.each do |plan|
      unless pref.include?(plan.prefecture_id)
       pref << plan.prefecture_id
      end
    end
    @pref = pref.sort
# binding.pry
    pref_rec = []
    @records.each do |record|
      unless pref_rec.include?(record.prefecture_id)
        pref_rec << record.prefecture_id
      end
    end
    @pref_rec = pref_rec.sort

  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
