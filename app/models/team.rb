class Team < ApplicationRecord
    has_many :signings
    has_many :players, through: :signings 
end