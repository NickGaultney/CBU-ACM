require 'open3'

class Api::V1::BotController < ApplicationController
	skip_before_action :verify_authenticity_token
	skip_before_action :authorized


	def github_invite
		Open3.popen2("python3 /home/CaptainWhymer/github_invite.py #{params[:username]}") do |i, o, t|
			p o.each { |line| Rails.logger.info line }
		end
		
		render :json "Success!"
	end
end
