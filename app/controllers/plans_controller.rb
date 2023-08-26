class PlansController < ApplicationController
  def index
    @plans = Plan.order("created_at DESC") #変更要。start_dateにしたいけどそれだとstart_dateをnull:falseにしなければ

  end

end
