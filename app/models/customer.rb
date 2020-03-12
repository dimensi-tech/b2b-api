class Customer < ApplicationRecord
  # # Include default devise modules. Others available are:
  # # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  has_secure_password

  validates :email, :password, presence: true
  validates :email,            uniqueness: true
end
