class Work < ActiveRecord::Base
  belongs_to :category
  has_many :images, :as => :assetable, :class_name => "Work::Image", :dependent => :destroy

  accepts_nested_attributes_for :images
  
end


class Work::Image < Asset
  has_attached_file :attachment, :styles => { :small => "200x150>", :large => "400x300>" }
end
