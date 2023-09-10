class SpotsController < ApplicationController
  before_action :move_to_index, except: [:index]

def new
  @spot = Spot.new
  @prefecture = Prefecture.find(params[:format])

end
def create
  @spot = Spot.new(spot_params)

  #一部の緯度が正常に保存されない事への対応
  @spot.latitude = BigDecimal(params[:spot][:latitude])
  @spot.longitude = BigDecimal(params[:spot][:longitude])

  prefecture = Prefecture.find(params[:spot][:prefecture_id])

  # binding.pry
  if @spot.save
    redirect_to prefecture_path( prefecture.id)

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
