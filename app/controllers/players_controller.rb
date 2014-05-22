class PlayersController < ApplicationController
	before_filter :signed_in_user, only: [:favorite, :remove, :position]
	def index
	end

	def show
		@player = Player.find_by_nfl_id(params[:nfl_id])
	end

	def search
		player_name = params[:player][:name].split
		first_name = player_name[0].capitalize
		last_name = player_name[1..-1].join(" ").capitalize

		@players = Player.where("first_name = ? OR last_name = ? OR first_name = ? OR last_name = ?", first_name, last_name, last_name, first_name)

		respond_to do |f|
			f.html
			f.json { render json: @players.to_json( include: [:season_passing_stats, :season_receiving_stats, :season_rushing_stats, :season_defensive_stats] ) }
		end
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
