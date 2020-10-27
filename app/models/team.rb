class Team < ApplicationRecord
  has_many :user_teams, dependent: :destroy
  has_many :users, through: :user_teams
end

# before_action :authenticate_admin, except: [:index, :show]
# before_action :authenticate_user