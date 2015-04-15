class Item < ActiveRecord::Base
  belongs_to :user
  validates :name, length: {minimum: 6}, presence: true
  
  def days_left
      (7 - (DateTime.now.to_date - created_at.to_date)).to_i
   end
  
  default_scope { order('created_at DESC') }
end
