class Player < ApplicationRecord
    has_many :signings
    has_many :teams, through: :signings 
end