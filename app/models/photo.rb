class Photo < ActiveRecord::Base
  acts_as_taggable

  belongs_to :user
  has_attached_file :image, styles: {medium: "300x300>", thumb: "100x100>"}

  validates :title, presence: true
  validates :image, presence: true, if: "image.blank?"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
