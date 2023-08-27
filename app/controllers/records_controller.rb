class RecordsController < ApplicationController
  before_action :move_to_index, except: [:index] #追加

  def index
    @records = Record.order("created_at DESC") #変更要。start_dateにしたいけどそれだとstart_dateをnull:falseにしなければ

  end
  def new
    @record = Record.new
    #  binding.pry
  
  end
  def create
    @record = Record.new(record_params)
    # binding.pry
    if @record.save
      redirect_to "/users/#{current_user.id}"
    else
      render "new", status: :unprocessable_entity
    end
  end
  
    private
  
    def move_to_index
      unless user_signed_in?
        redirect_to root_path
      end
    end
    def record_params
      params.require(:record).permit(:destination,:text,:prefecture_id,:city,:start_date,:end_date).merge(user_id: current_user.id)
    end
  

end
