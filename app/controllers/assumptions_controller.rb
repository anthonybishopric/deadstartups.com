class AssumptionsController < ApplicationController
  
  
  def index
    if params[:q]
      @assumptions = Assumption.named(params[:q])
    else
      @assumptions = Assumption.order("created_at desc").page(params[:page]).per(20)
    end
    respond_to do |format|
      format.html
      format.json { 
        render :json => (@assumptions.map do |tag|
          {:id => tag.id, :name => tag.value}
        end)
      }
    end
  end
  
  def new
    
  end
  
  def create
    assumption = Assumption.create(params[:assumption])
    if assumption.persisted?
      redirect_to assumptions_path
    else
      flash[:errors] = assumption.errors.full_messages;
      redirect_to :new
    end
    
  end
  
end