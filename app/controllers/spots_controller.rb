class SpotsController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :set_spot, only: [:show, :edit, :update]

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
# def show
#   # @spot = Spot.find(params[:id])

# end
# def edit
#   # @spot = Spot.find(params[:id])
#   @prefecture = Prefecture.find(@spot.prefecture_id)

# end
# def update #editでマーカー位置を変更したときに住所に反映されない。修正要。
#   # binding.pry
#   if @spot.update(spot_params)
   
#     redirect_to prefecture_path(@spot.prefecture_id)
#   else
#     render :edit, status: :unprocessable_entity, locals: { spot: @spot }
#   end
# end

def destroy
  spot = Spot.find(params[:id])
  spot.destroy
  response.headers["Turbo-Stream"] = "false"
  redirect_to prefecture_path(spot.prefecture_id)
end



  private

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
  def spot_params
    params.require(:spot).permit(:icon_id,:spot_name,:information,:prefecture_id,:address,:latitude,:longitude).merge(user_id: current_user.id)
  end
  def set_spot
    @spot = Spot.find(params[:id])
  end

end
