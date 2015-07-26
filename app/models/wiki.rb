class Wiki < ActiveRecord::Base
  belongs_to :user

  default_scope { order('created_at DESC') }
  
  scope :visible_to, -> (current_user) { where('private = ?', false) or where('user_id = ?', current_user)}
end
