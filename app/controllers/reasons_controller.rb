class ReasonsController < ApplicationController
  
  def show
    @reason = Reason.find_by_id(params[:id])
  end
  
  def showquestion
    @reason = Reason.find_by_id(params[:id])
    @topic = Topic.find_by_id(@reason.topic_id)
    @quizactivity = Quizactivity.new
  end
  
end