class QuizzesController < ApplicationController
  def show
    @num_english = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
      "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen",
      "eighteen", "nineteen", "twenty"]
    
    quiz = Quiz.find_by_id(params[:id])
    @topic = Topic.find_by_id(quiz.topic_id)
    reasons = Reason.where(topic_id: @topic.id, question_approved: true)
    @reason = reasons.first
    @quizactivity = Quizactivity.new
  end
  
end