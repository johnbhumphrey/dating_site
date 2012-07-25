module SessionsHelper

	def sign_in(user)
		session[:user_id] = user.id
		self.current_user = user
	end

	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		else
			@current_user= nil
		end
	end

	def signed_in?
	    !session[:user_id].nil?
    end

    def current_user= (user)
    	@current_user= user
	end

	def sign_out
		session[:user_id] = nil
		self.current_user = nil
	end
	
	def authenticate
	    deny_access unless signed_in?
	end
	  
	def deny_access
	    store_location
	    redirect_to login_path, flash: { notice: "Please sign in to access this page." }
    end

    def store_location
    	session[:return_to]= request.fullpath #return to can be any key
    #session is a cookie that persists for 1 browser session
  	end

    def redirect_back_or(default, flash= nil)
        if flash
        	redirect_to((session[:return_to] || default), flash)
        else
        	redirect_to(session[:return_to])
        end
        clear_return_to
    end

    def clear_return_to
    	session[:return_to]= nil
    end
end
