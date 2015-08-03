class Wiki < ActiveRecord::Base
  belongs_to :user
  #added for collaborators
  has_many :collaborators
  has_many :users, through: :collaborators
  
  after_initialize :setPublic

  def setPublic
    self.private  ||= false #will set the default role to standard only if it's nil
  end

  default_scope { order('created_at DESC') }
  
  def public?
    private == false
  end

  scope :visible_to, -> (current_user) { where('private = ? OR user_id = ?', false, current_user.id) }

end
