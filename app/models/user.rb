class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  #added for collaborators
  has_many :collaborators
  has_many :wikis
  has_many :collaborated_wikis, through: :collaborators, source: :wiki 
  

  after_initialize :init

  def init
    self.role  ||= 'standard' #will set the default role to standard only if it's nil
  end

  def admin?
    role == 'admin'
  end

  def standard?
    role == 'standard'
  end

  def premium?
    role == 'premium'
  end


end
