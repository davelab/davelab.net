class Work < ActiveRecord::Base

  before_save :destroy_image?

  belongs_to :category
  has_many :images, :as => :assetable, :class_name => "Work::Image", :dependent => :destroy

  accepts_nested_attributes_for :images, :reject_if => proc { |attributes| attributes['attachment'].blank? }



  def image_delete
    @image_delete ||= "0"
  end

  def image_delete=(value)
    @image_delete = value
  end

private
  def destroy_image?
    self.attachment.clear if @image_delete == "1"
  end

  
end


class Work::Image < Asset
  has_attached_file :attachment, :styles => {:small => "200x150>", :large => "400x300>"},
    :url  => "/uploads/works/:id/:style/:basename.:extension",
    :path => ":rails_root/public/uploads/works/:id/:style/:basename.:extension"

end


