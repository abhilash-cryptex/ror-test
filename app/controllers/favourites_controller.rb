class FavouritesController < ApplicationController

	def index
		if params[:favourite] == 'false'
			Favourite.where(user_id: current_user.id, show_id: params[:show_id]).destroy_all rescue nil
		else
			Favourite.create(user_id: current_user.id, show_id: params[:show_id])
		end
		redirect_to root_path
	end
end
