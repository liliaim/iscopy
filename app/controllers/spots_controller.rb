class SpotsController < ApplicationController
  before_action :move_to_index, except: [:index]

def new
  @spot = Spot.new
  #  binding.pry
  @prefecture = Prefecture.find(params[:format])

end
def create
  @spot = Spot.new(spot_params)
  #一部の緯度が正常に保存されない事への対応
  # latitude_string = params[:spot][:latitude]
  @spot.latitude = BigDecimal(params[:spot][:latitude])
  @spot.longitude = BigDecimal(params[:spot][:longitude])
  # binding.pry

  # @plan = Plan.find(params[:plan_id]) #planのID
  # @spots = Spot.where(user_id: @plan.user_id, prefecture_id: @plan.prefecture_id)
  @prefecture = Prefecture.find(params[:spot][:prefecture_id])
  # @plans = Plan.where(user_id: current_user.id, prefecture_id: @prefecture.id)
  # @spots = Spot.where(user_id: current_user.id, prefecture_id: @prefecture.id)

  # binding.pry
  if @spot.save
    redirect_to plan_path( @prefecture.id)

  else
    render new_spot_path, status: :unprocessable_entity
  end
end
def show
  @spot = Spot.find(params[:id])

end
# def edit
#   @spot = Spot.find(params[:id])
#   @prefecture = Prefecture.find(@spot.prefecture_id)

# end
# def update #editでマーカー位置を変更したときに住所に反映されない。修正要。
#   if @spot.update(spot_params)
#     redirect_to plan_path(@spot.id)
#   else
#     render :edit, status: :unprocessable_entity, locals: { spot: @spot }
#   end
# end




  private

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
  def spot_params
    params.require(:spot).permit(:icon_id,:spot_name,:information,:prefecture_id,:address,:latitude,:logitude).merge(user_id: current_user.id)
  end
end
