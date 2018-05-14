class Description < ActiveRecord::Base
	validates :title, presence: true
	validates :description, presence: true, uniqueness: {case_sensitive: false}, length: {minimum:3,maximum:30}
end