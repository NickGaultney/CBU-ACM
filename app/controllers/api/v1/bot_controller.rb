class Api::V1::BotController < ApplicationController
	def github_invite
		render json: system("python3 /home/CaptainWhymer/github_invite.py #{params[username]}")
	end
end
