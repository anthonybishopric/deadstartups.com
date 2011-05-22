class TagsController < ApplicationController
  
  def index
    if params[:q]
      @tags = Tag.named(params[:q])
    else
      @tags = Tag.page(params[:page]).per(20)
    end
    respond_to do |format|
      format.json { 
        render :json => (@tags.map do |tag|
          {:id => tag.id, :name => tag.name}
        end)
      }
    end
  end
  
end