class PlayersController < ApplicationController
	def index
	end

	def show
		@player = Player.find(params[:id])
	end

	def create
	end
end
