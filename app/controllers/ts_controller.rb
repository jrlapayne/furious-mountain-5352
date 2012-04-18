class TsController < ApplicationController
  def index
    @title = "All Topics"
    @topics = T.all
  end
  
  def new
    @title = "New Topic"
    @topic = T.new
  end
  
  def create
    @topic = T.new(params[:topic])

    respond_to do |format|
      if @topic.save
        format.html { redirect_to topics_path, notice: 'Topic was successfully created.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @topic = T.find_by_id(params[:id])
    reasons = Reason.where(topic_id: @topic.id, question_approved: true)
    @reason = reasons.first
  end
end