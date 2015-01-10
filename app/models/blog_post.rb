class BlogPost < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title, :slug
  belongs_to :author, :class_name => "User"
  mount_uploader :image, CoverUploader
  process_in_background :image
end