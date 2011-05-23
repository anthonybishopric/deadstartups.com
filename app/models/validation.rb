class Validation < ActiveRecord::Base
  
  validates_presence_of :how
  
  belongs_to :startup
  belongs_to :assumption
  
  
  
end