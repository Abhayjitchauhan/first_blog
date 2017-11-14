class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  # after_save :assign_value
  has_many :assignments, dependent: :destroy
  has_many :roles, through: :assignments
  accepts_nested_attributes_for :assignments

  has_many :articles
  has_many :comments


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def role_symbols
    @role_symbols=(roles || []).map {|r|
     r.title.to_sym }
  end

# private
# def assign_value
#   debugger
# Assignment.create(:role_id=> 1)
# end

end
