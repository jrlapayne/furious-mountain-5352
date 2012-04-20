class QuizzesController < ApplicationController
  def show
    @num_english = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
      "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen",
      "eighteen", "nineteen", "twenty"]
    
    quiz = Quiz.find_by_id(params[:id])
    @topic = T.find_by_id(quiz.t_id)
    reasons = Reason.where(t_id: @topic.id, question_approved: true)
    @reason = reasons.first
    @quizactivity = Quizactivity.new
  end
  
end