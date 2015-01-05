class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :password, presence: true, length: {minimum: 5, maximum: 120}, on: :create
  validates :password, length: {minimum: 5, maximum: 120}, on: :update, allow_blank: true
  
  has_many :posts
  
  mount_uploader :avatar, AvatarUploader
           
  def full_name
    name = self.first_name.to_s + ' ' + self.last_name.to_s
    return name
  end
  
  after_create do
      subscribe_user
  end
  
  def subscribe_user
    if Subscription.find_by_email(self.email) == nil
      Subscription.create(first_name: self.first_name, last_name: self.last_name, email: self.email)
    end
  end
  
end
