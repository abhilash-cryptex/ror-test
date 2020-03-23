class Favourite < ActiveRecord::Base
	belongs_to :show
	belongs_to :user

	def self.send_email_reminders
		self.each do |favorite|
      UserMailer.send_email_reminders(favorite.user, favorite.show)
		end
	end
end
