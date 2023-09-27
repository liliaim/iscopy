class PrefecturesController < ApplicationController
  def show
    @prefecture = Prefecture.find(params[:id])
    @records = Record.where(user_id: current_user.id, prefecture_id: @prefecture.id)
    @plans = Plan.where(user_id: current_user.id, prefecture_id: @prefecture.id)
    @spots = Spot.where(user_id: current_user.id, prefecture_id: @prefecture.id).includes([:image_attachment])

  end

end
