class ValidationsController < ApplicationController
  
  
  def create
    request.format = :js
    @validation = Validation.create(params[:validation])
    unless @validation.persisted?
      puts @validation.errors.inspect
      respond_to do |format|    
        format.js{ head :bad_request }
      end
    else
    
      respond_to do |format|
        format.js
      end
  
    end
    
  end
  
end