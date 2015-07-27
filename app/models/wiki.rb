class Wiki < ActiveRecord::Base
  belongs_to :user

  default_scope { order('created_at DESC') }
  
  #scope :visible_to, -> (current_user) { where('private = ?', false) or where('user_id = ?', current_user)}
  #scope :visible_to, -> (private) { where('private = ?', false) }
  scope :visible_to, -> (current_user) { where('private = ? OR user_id = ?', false, current_user.id) }

  after_initialize :setFalse

  def setFalse
    self.private  ||= false #will set the default role to standard only if it's nil
  end
end
