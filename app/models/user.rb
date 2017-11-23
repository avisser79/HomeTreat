class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :specialist

  mount_uploader :photo, PhotoUploader

  def full_profile?
    !first_name.blank? && !last_name.blank? && !photo.blank?
  end

end
