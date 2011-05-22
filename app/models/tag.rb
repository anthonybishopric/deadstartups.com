class Tag < ActiveRecord::Base
  
  validates_presence_of :name

  has_and_belongs_to_many :startups
  
  scope :named, lambda {|query| 
    criteria = self
    query.split(%r{\s+}).each do |q|
      criteria = criteria.where("name ~* ?", q)
    end
    criteria
  }
  
end