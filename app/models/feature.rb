require 'carrierwave/orm/activerecord'

class Feature < ActiveRecord::Base
	validates :title, presence: true, uniqueness: {case_sensitive: false}
	validates :status, presence: true
	validates_inclusion_of :status, :in => ['New', 'Started', 'Resolved', 'Completed'], :allow_nil => true
	belongs_to :project
	belongs_to :developer, :class_name => "User"
  	belongs_to :creator, :class_name => "User"	
  	mount_uploader :avatars, AvatarUploader
end



# feature_type validation feature or bug only