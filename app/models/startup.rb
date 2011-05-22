class Startup < ActiveRecord::Base

  attr_accessible :name, :reason, :website, :born, :died, :tag_id_list
  
  validates_presence_of :name, :reason, :born, :died
  validates_format_of :website, :with => URI::regexp(%w(http https))
  
  has_and_belongs_to_many :tags
  
  scope :named, lambda {|query| 
    criteria = self
    query.split(%r{\s+}).each do |q|
      criteria = criteria.where("name ~* ?", q)
    end
    criteria
  }
  
  def tag_id_list
    ""
  end
  
  def tag_id_list=(tags)
    self.tag_ids = tags.split(",")
  end
  
end