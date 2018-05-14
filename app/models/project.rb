class Project < ApplicationRecord
	belongs_to :manager, :class_name => "User"
	has_many :features, :class_name => "Feature"
	has_and_belongs_to_many :users
end
