class Api::V1::TeamsController < ApplicationController

    def index
        teams = Team.all 

        enhanced_teams = teams.map do |team|
            
            {id: team["id"], name: team["teamName"] , players: team.players }


            # {id["team.id"], name["team.teamName"], players["team.players"]}
        end

        render json: enhanced_teams
    end
    
    def show
        team = team.find(params[:id])
        render json: team 
    end

    def create
        team = Team.create(team_params)
        qb = Player.find_by(name: params["QB"])
        rb1 = Player.find_by(name: params["RB1"])
        rb2 = Player.find_by(name: params["RB2"])
        wr1 = Player.find_by(name: params["WR1"])
        wr2 = Player.find_by(name: params["WR2"])
        te = Player.find_by(name: params["TE"])
        defense = Player.find_by(name: params["DEF"])
        k = Player.find_by(name: params["K"])
    #  byebug 
        Signing.create(team_id: team.id, player_id: qb.id)
        Signing.create(team_id: team.id, player_id: rb1.id)
        Signing.create(team_id: team.id, player_id: rb2.id)
        Signing.create(team_id: team.id, player_id: wr1.id)
        Signing.create(team_id: team.id, player_id: wr2.id)
        Signing.create(team_id: team.id, player_id: te.id)
        Signing.create(team_id: team.id, player_id: defense.id)
        Signing.create(team_id: team.id, player_id: k.id)


          render json: team
    end


    def update
        team = Team.find(params[:id])
        players = Player.all
        team.signings.each do |signing|
            players.each do |player|
                params["players"].each do |param|
                    if player.id === signing.player_id
                        if player.position === param["player"]["position"]
                            if player.name != param["player"]["name"]
                                signing.update(team_id: team.id, player_id: param["player"]["id"])
                            end
                        end
                    end
                end
            end
        end
        teams = Team.all
        render json: teams
    end

    def destroy
        team = Team.find(params[:id])
        team.delete 
        teams = Team.all

        render json: teams
      end

    private 

    def team_params
        params.require(:team).permit(:teamName)
      end

end