class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :first_name, :last_name, :job_type
  # attr_accessible :title, :body

  validates :username, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  has_many :events, :dependent => :delete_all
end
