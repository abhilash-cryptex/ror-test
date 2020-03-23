class SearchController < ApplicationController

	def index
    @shows = Show.where("name ilike :q ", q: "%#{params[:search]}%")
    render 'home/index'
	end
end
