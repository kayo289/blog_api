# frozen_string_literal: true
class ApplicationController < ActionController::API
	include ActionController::HttpAuthentication::Token::ControllerMethods

	class NoAuthorizationHeaderError < StandardError; end

	class NoJWTError < StandardError; end

	def verified_id_token
	  id_token.verified_id_token
	end

	def id_token
	  Firebase::Auth::IDTokenKeeper::IDToken.new(jwt)
	end

	def jwt
		authorization_header.to_s.split(' ')[1].presence || raise(NoJWTError)
	end

	def authorization_header
	  request.headers['Authorization'].presence || raise(NoAuthorizationHeaderError)
	end

	def current_user
		# return unless verified_id_token
		# @current_user ||= User.find_by(uid: verified_id_token[0]['user_id'])
		if request.headers['Authorization']
			if User.find_by(uid: verified_id_token[0]['user_id'])
				@current_user =  User.find_by(uid: verified_id_token[0]['user_id'])
			else
				@current_user = User.new()
				@current_user.email = verified_id_token[0]['email']
				@current_user.uid = verified_id_token[0]['user_id']
				@current_user.save
			end
		else
			@current_user = nil
			render status: 403, json: { status: 403, message: 'you should login' }
		end
	end
end