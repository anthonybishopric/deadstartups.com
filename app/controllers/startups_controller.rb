class StartupsController < ApplicationController
  
  def index
    @startups = Startup.order("created_at desc").page(params[:page]).per(10)
    if params[:tag]
      @startups = @startups.joins(:tags).where(:tags => {:name => params[:tag]})
    end
  end
  
  def create
    @startup = Startup.create(params[:startup])
    unless @startup.persisted?
      flash[:errors] = @startup.errors.full_messages
    end
    redirect_to startups_path
  end
  
end