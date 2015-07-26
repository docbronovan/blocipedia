class Wiki < ActiveRecord::Base
  belongs_to :user

  default_scope { order('created_at DESC') }
  
  scope :visible_to, -> (private) { where('private = ?', false) }
end
