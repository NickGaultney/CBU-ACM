require 'open3'

class Api::V1::BotController < ApplicationController
	skip_before_action :verify_authenticity_token

	def github_invite
		Open3.popen2("python3 /home/CaptainWhymer/github_invite.py #{params[username]}") do |i, o, t|
			p o.each { |line| puts line; sleep(5) }
		end
	end
end
