class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :encrypted_password, 
         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :first_name_ruby, presence: true
         validates :last_name_ruby, presence: true
         validates :real_name, presence: true
         validates :birthsay, presence: true
         validates :encrypted_password,:password,:password_confirmation, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
end
