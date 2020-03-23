class Show < ActiveRecord::Base

	serialize :air_day, JSON
	belongs_to :channel
	has_many :favourites

	def is_favourite(user_id)
		return Favourite.where(user_id: user_id, show_id: self.id).present?
	end
end
