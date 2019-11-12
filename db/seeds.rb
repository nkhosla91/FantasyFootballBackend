require 'rest-client'
require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Player.destroy_all

url = 'https://api.fantasy.nfl.com/v1/players/stats?statType=seasonStats&season=2019&week=9&format=json'
request = RestClient.get url

request_array = JSON.parse(request)

sorted_players = request_array["players"].sort_by { |player| player["name"] }

puts sorted_players[0]

sorted_players.each do |player|
    Player.create (
        {name: player["name"],
        position: player["position"],
        teamAbbr: player["teamAbbr"],
        seasonPts: player["seasonPts"]
}
    )
end
