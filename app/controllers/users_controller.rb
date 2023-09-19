class UsersController < ApplicationController
  before_action :move_to_index, except: [:index] #追加
  def index
  end
  def show
    @nickname = current_user.nickname
    @user = User.find(current_user.id)
    @plans = @user.plans
    @records = @user.records

    @records_page = Record.where(user_id: current_user.id).page(params[:record_page])
    @plans_page = Plan.where(user_id: current_user.id).page(params[:plan_page])

    #planのあるprefecture_idを@pref_has_planへ格納
    pref_has_plan = []
    @plans.each do |plan|
      unless pref_has_plan.include?(plan.prefecture_id)
        pref_has_plan << plan.prefecture_id
      end
    end
    @pref_has_plan = pref_has_plan.sort

    #recordのあるprefecture_idを@pref_has_recordへ格納
    pref_has_record = []
    @records.each do |record|
      unless pref_has_record.include?(record.prefecture_id)
        pref_has_record << record.prefecture_id
      end
    end
    @pref_has_record = pref_has_record.sort

  end

  def paginate
    @records_page = Record.where(user_id: current_user.id).page(params[:record_page])
    @plans_page = Plan.where(user_id: current_user.id).page(params[:plan_page])
       render layout: false
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

end
