class PlayersController < ApplicationController
	before_filter :signed_in_user, only: [:favorite, :remove, :position]
	def index
	end

	def show
		@player = Player.find_by_nfl_id(params[:nfl_id])
		gon.player_receiving = @player.season_receiving_stats.order(year: :asc)
		gon.player_rushing = @player.season_rushing_stats.order(year: :asc)
		gon.player_passing = @player.season_passing_stats.order(year: :asc)
		gon.player_defensive = @player.season_defensive_stats.order(year: :asc)
	end

	def favorite 
		p = Player.find_by_nfl_id(params[:nfl_id])
		user = current_user
		user.players << p
		flash[:success] = "#{p.name} was added!"

		redirect_to action: :show
	end

	def remove 
		p = Player.find_by_nfl_id(params[:nfl_id])
		user = current_user
		user.players.destroy p
		flash[:success] = "#{p.name} was destroyed!"

		redirect_to action: :show
	end

	def position
		p = Position.find_by_name(params[:name])
		@players = p.players
	end

end
