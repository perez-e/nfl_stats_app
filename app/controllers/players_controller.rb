class PlayersController < ApplicationController
	def index
	end

	def show
		@player = Player.find_by_nfl_id(params[:nfl_id])
		gon.player_receiving = @player.season_receiving_stats
		gon.player_rushing = @player.season_rushing_stats
		gon.player_passing = @player.season_passing_stats
		gon.player_defensive = @player.season_defensive_stats
	end

	def create
		player_name = params[:player][:name]
		player_info = Player.player_info(player_name)

		if !player_info.blank? && !Player.find_by_nfl_id(player_info[:nfl_id])
			# if player is not in database create player and fill in stats
			p = Player.create(player_info)
			p.season_passing_stats = SeasonPassingStat.passing_object(p.name)
			p.season_rushing_stats = SeasonRushingStat.rushing_object(p.name)
			p.season_receiving_stats = SeasonReceivingStat.receiving_object(p.name)
			p.season_defensive_stats = SeasonDefensiveStat.defensive_object(p.name)

			redirect_to "/players/#{p.nfl_id}"

		elsif !player_info.blank? && Player.find_by_nfl_id(player_info[:nfl_id])
			# if player is in the database pull up there stats
			p = Player.find_by_nfl_id(player_info[:nfl_id])
			redirect_to "/players/#{p.nfl_id}"

		else 
			redirect_to root_path
		end
	end
end
