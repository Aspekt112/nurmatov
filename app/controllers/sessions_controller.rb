class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
	  else
	    # Create an error message and re-render the signin form.
	        flash.now[:error] = 'Invalid email/password combination'
      		render 'new'
	  end
  	end

	def destroy
		sign_out
    	redirect_to articles_path
	end

	def User.new_remember_token
    	SecureRandom.urlsafe_base64
  	end

  	def User.encrypt(token)
    	Digest::SHA1.hexdigest(token.to_s)
  	end

  	private

    	def create_remember_token
      		self.remember_token = User.encrypt(User.new_remember_token)
    	end
end
