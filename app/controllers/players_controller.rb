class PlayersController < ApplicationController
	def index
	end

	def show
		@player = Player.find(params[:id])
		gon.player_receiving = @player.season_receiving_stats
	end

	def create

		redirect_to root_path
	end
end
