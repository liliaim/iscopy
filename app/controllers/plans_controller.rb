class PlansController < ApplicationController
  # before_action :authenticate_user!, except: [:index]
  before_action :move_to_index, except: [:index] #追加
  before_action :set_plan, only: [:edit,  :update]

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
  def edit
    redirect_to new_user_session_path if user_signed_in? == false
    return if (current_user.id == @plan.user_id) 
    redirect_to user_path
  end

  def update
    if @plan.update(plan_params)
      redirect_to user_path(current_user.id)
    else
      render :edit, status: :unprocessable_entity, locals: { plan: @plan }
    end
  end

  def show
    @prefecture = Prefecture.find(params[:id])
  @records = Record.where(user_id: current_user.id, prefecture_id: @prefecture.id)
  @plans = Plan.where(user_id: current_user.id, prefecture_id: @prefecture.id)
  @spots = Spot.where(user_id: current_user.id, prefecture_id: @prefecture.id)
      #  binding.pry

  end
  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    response.headers["Turbo-Stream"] = "false"
    redirect_to user_path(current_user.id)
  end

  private

  def move_to_index
    unless user_signed_in? 
      redirect_to root_path
    end
  end
  def set_plan
    @plan = Plan.find(params[:id])
  end
  def plan_params
    params.require(:plan).permit(:destination,:text,:prefecture_id,:city,:start_date,:end_date).merge(user_id: current_user.id)
  end


end
