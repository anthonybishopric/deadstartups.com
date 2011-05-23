class Assumption < ActiveRecord::Base
  
  has_many :validations
  has_many :startups, :through => :startups
  
  validates_presence_of :value
  
  scope :named, lambda {|query| 
    criteria = self
    query.split(%r{\s+}).each do |q|
      criteria = criteria.where("value ~* ?", q)
    end
    criteria
  }
  
  
end