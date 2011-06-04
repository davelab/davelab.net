class Work < ActiveRecord::Base


  belongs_to :category
  has_many :images, :as => :assetable, :class_name => "Work::Image", :dependent => :destroy

  accepts_nested_attributes_for :images,  :reject_if => proc { |attributes| attributes['attachment'].blank? and attributes['_destroy'] == "false" }, :allow_destroy   => true


  
end


class Work::Image < Asset
  has_attached_file :attachment, :styles => {:small => "200x150>", :large => "400x300>"},
    :url  => "/uploads/works/:id/:style/:basename.:extension",
    :path => ":rails_root/public/uploads/works/:id/:style/:basename.:extension"

end


