class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true, length: {minimum:2, maximum:80}, on: :update

  has_one :user_profile

  accepts_nested_attributes_for :user_profile, reject_if: :all_blank, allow_destroy: false

  #Virtual Attribute
  def full_name
    [self.first_name, self.last_name].join(' ')
  end
  
end
