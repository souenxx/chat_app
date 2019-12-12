module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :current_user

    def connect
      #self.current_user=find_verified_user
      self.current_user=User.find_by(id: session['user_id'])
    end

    private
  
    def session
      cookies.encrypted[Rails.application.config.session_options[:key]]
    end
  
    #def find_verified_user
      #if current_user = User.find_by(id: cookies.encrypted[:user_id])
        #current_user
      #else 
        #reject_unauthorized_connection 
      #end
    #end
    
  end
end
