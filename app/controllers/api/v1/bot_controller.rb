class Api::V1::BotController < ApplicationController
	skip_before_action :authorized, only: [:github_invite]
	def github_invite
		render json: system("python3 /home/CaptainWhymer/github_invite.py #{params[username]}")
	end
end
