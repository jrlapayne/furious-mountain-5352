class ReasonsController < ApplicationController
  
  def show
    @reason = Reason.find_by_id(params[:id])
  end
  
  def showquestion
      
    @reason = Reason.find_by_id(params[:id])
    @topic = T.find_by_id(@reason.topic_id)
    @quizactivity = Quizactivity.new
  end
  
  def correct
    reason = Reason.find_by_id(params[:id])
    @quizactivity = Quizactivity.create(topic_id: reason.topic_id, reason_id: reason.id, is_correct: true)
    reasons = Reason.where(topic_id: @quizactivity.topic_id, question_approved: true)
    
    i = -1
    while i < reasons.count
      i += 1
      break if @quizactivity.reason_id == reasons[i].id  
    end
    
    if i == (reasons.count-1)
      redirect_to ts_path
    else
      redirect_to showquestion_reason_path(reasons[i+1].id)
    end
  end
  
  def wrong
    reason = Reason.find_by_id(params[:id])
    @quizactivity = Quizactivity.create(topic_id: reason.topic_id, reason_id: reason.id, is_correct: false)
    reasons = Reason.where(topic_id: @quizactivity.topic_id, question_approved: true)
    
    i = -1
    while i < reasons.count
      i += 1
      break if @quizactivity.reason_id == reasons[i].id  
    end
    
    if i == (reasons.count-1)
      redirect_to ts_path
    else
      redirect_to showquestion_reason_path(reasons[i+1].id)
    end
  end
  
end