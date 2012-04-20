class ReasonsController < ApplicationController
  
  def show
    @reason = Reason.find_by_id(params[:id])
    @topic = T.find_by_id(@reason.t_id)
  end
  
  def create
    reason = Reason.new(params[:reason])
    reason.score = 0
    reason.save
    
    redirect_to T.find_by_id(reason.t_id)
  end
  
  def edit
    @reason = Reason.find_by_id(params[:id])
    @topic = T.find_by_id(@reason.t_id)
  end
  
  def update
    @reason = Reason.find_by_id(params[:id])
    @reason.update_attributes(params[:reason])
    @topic = T.find_by_id(@reason.t_id)
    
    redirect_to @topic
  end
  
  def showquestion
      
    @reason = Reason.find_by_id(params[:id])
    @topic = T.find_by_id(@reason.t_id)
    @quizactivity = Quizactivity.new
  end
  
  def correct
    reason = Reason.find_by_id(params[:id])
    @quizactivity = Quizactivity.create(t_id: reason.t_id, reason_id: reason.id, is_correct: true)
    reasons = Reason.where(t_id: @quizactivity.t_id, question_approved: true)
    
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
    @quizactivity = Quizactivity.create(t_id: reason.t_id, reason_id: reason.id, is_correct: false)
    reasons = Reason.where(t_id: @quizactivity.t_id, question_approved: true)
    
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
  
  def upvote
    reason = Reason.find_by_id(params[:id])
    reason.scorings.create(vote: 1)
    
    reason.score = Scoring.where(reason_id: reason.id).sum(:vote)
    reason.save
    
    topic = T.find_by_id(reason.t_id)
    if reason.is_pro?
      redirect_to votepros_t_path(topic)
    else
      redirect_to votecons_t_path(topic)
    end
  end
  
  def downvote
    reason = Reason.find_by_id(params[:id])
    reason.scorings.create(vote: -1)
    
    reason.score = Scoring.where(reason_id: reason.id).sum(:vote)
    reason.save
    
    topic = T.find_by_id(reason.t_id)
    if reason.is_pro?
      redirect_to votepros_t_path(topic)
    else
      redirect_to votecons_t_path(topic)
    end
  end
  
end