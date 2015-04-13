class User < ActiveRecord::Base
  has_many :items
  
 def admin?
   role == 'admin'
 end
 
 def moderator?
   role == 'moderator'
 end
  
  mount_uploader :avatar, AvatarUploader
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
