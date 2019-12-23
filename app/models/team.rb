class Team < ApplicationRecord
  enum team_status: [:valor, :mystic, :instinct]  
  has_many :trainers
end
