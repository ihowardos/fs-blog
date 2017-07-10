class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :blogs

  mount_uploader :photo, PhotoUploader

  def get_username
    "#{name} #{surname}"
  end

  def created_at_h
    created_at.strftime("%d/%m/%Y %H:%M")
  end

  def current_user?(user_id)
    id == user_id
  end
end
