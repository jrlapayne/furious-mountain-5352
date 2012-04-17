class QuizactivitiesController < ApplicationController
  
  def create
    @quizactivity = Quizactivity.new(params[:quizactivity])
    reasons = Reason.where(topic_id: @quizactivity.topic_id, question_approved: true)
    
    i = -1
    while i < reasons.count
      i += 1
      break if @quizactivity.reason_id == reasons[i].id  
    end
    
    if i == (reasons.count-1)
      @quizactivity.next_reason = 999999
    else
      @quizactivity.next_reason = reasons[i+1].id
    end
    @quizactivity.save
    
    redirect_to @quizactivity
  end

  def show
    @quizactivity = Quizactivity.find_by_id(params[:id])
    @reason = Reason.find_by_id(@quizactivity.reason_id)
  end
end