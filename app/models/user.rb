class User < ApplicationRecord
  has_secure_password
  validates :email, :name, presence: true, uniqueness: true

  has_many :user_teams, dependent: :destroy
  has_many :teams, through: :user_teams
end
