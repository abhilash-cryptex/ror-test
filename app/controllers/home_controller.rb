class HomeController < ApplicationController

	def index
		@shows = Show.all.includes(:channel)
	end

end
