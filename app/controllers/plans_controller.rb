class PlansController < ApplicationController
  def index
    @plans = Plan.order("created_at DESC") #変更要。start_dateにしたいけどそれだとstart_dateをnull:falseにしなければ
  end
  def show
    @prefecture = Prefecture.find(params[:id])
    # @spot = Spot.new
    # @plan = Plan.find(params[:id])
    @plans = Plan.where(user_id: current_user.id, prefecture_id: @prefecture.id)
    # @spots = Spot.where(user_id: @plan.user_id, prefecture_id: @plan.prefecture_id)
   
  end
  
end
