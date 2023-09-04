class PlansController < ApplicationController
  before_action :move_to_index, except: [:index] #追加

  def index
    @plans = Plan.order("created_at DESC") #変更要。start_dateにしたいけどそれだとstart_dateをnull:falseにしなければ
  end
  def new
    @plan = Plan.new
    #  binding.pry
  
  end
  def create
    @plan = Plan.new(plan_params)
    # binding.pry
    if @plan.save
      redirect_to "/users/#{current_user.id}"
    else
      render "new", status: :unprocessable_entity
    end
  end
  def show
    @prefecture = Prefecture.find(params[:id])
    # @spot = Spot.new
  # @plan = Plan.find(params[:id])
  @records = Record.where(user_id: current_user.id, prefecture_id: @prefecture.id)
  @plans = Plan.where(user_id: current_user.id, prefecture_id: @prefecture.id)
  @spots = Spot.where(user_id: current_user.id, prefecture_id: @prefecture.id)
      #  binding.pry

  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
  def plan_params
    params.require(:plan).permit(:destination,:text,:prefecture_id,:city,:start_date,:end_date).merge(user_id: current_user.id)
  end


end
