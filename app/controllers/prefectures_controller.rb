class PrefecturesController < ApplicationController
  def index
  end
  def show
    @prefecture = Prefecture.find(params[:id])
    @records = Record.where(user_id: current_user.id, prefecture_id: @prefecture.id)
    @plans = Plan.where(user_id: current_user.id, prefecture_id: @prefecture.id)
    @spots = Spot.where(user_id: current_user.id, prefecture_id: @prefecture.id)

  end

end
