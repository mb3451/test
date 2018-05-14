class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	
  	
  	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
	has_many :creator_bugs, :class_name => 'Bug', :foreign_key => 'creator_id'
	has_many :manager_projects, :class_name => 'Project', :foreign_key => 'manager_id'
	has_many :developer_bugs, :class_name => 'Bug', :foreign_key => 'developer_id'
	has_and_belongs_to_many :projects

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, length: { maximum: 105 },
	uniqueness: { case_sensitive: false },
	format: { with: VALID_EMAIL_REGEX }
	validates :name, presence: true
	validates :user_type, presence: true
	validates_inclusion_of :user_type, :in => ['Manager', 'QA', 'Developer']
end


# No user roles/types have been added. 
