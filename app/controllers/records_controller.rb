class RecordsController < ApplicationController
  # before_action :move_to_index, except: [:index] #追加
  before_action :set_record, only: [:edit,  :update]

  def index
    @records = Record.order("created_at DESC") # TODO    :変更要。start_dateにしたいけどそれだとstart_dateをnull:falseにしなければ

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
      render new_record_path, status: :unprocessable_entity
    end
  end
  def edit
    redirect_to new_user_session_path if user_signed_in? == false
    return if (current_user.id == @record.user_id) 
    redirect_to user_path
  end

  def update
    if @record.update(record_params)
      redirect_to user_path(current_user.id)
    else
      render :edit, status: :unprocessable_entity, locals: { record: @record }
    end
  end
  def destroy
    record = Record.find(params[:id])
    record.destroy
    response.headers["Turbo-Stream"] = "false"
    redirect_to user_path(current_user.id)
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
    def set_record
      @record = Record.find(params[:id])
    end
  

end
