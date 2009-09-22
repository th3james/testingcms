# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  layout "client"
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  # Session
  session :session_key => 'UNEPWCMCSession'
  before_filter :authorize
  # Get the Menu Items
  before_filter :find_all_sections

  protected
  # Override in controller classes that should require authentication
  def secure?
    false
  end

  private
    def find_all_sections
      @all_sections = Section.all
    end

    def authorize(force_secure=false)
      if (secure? || force_secure) && session[:user_id].nil?
        session["return_to"] = request.request_uri
        redirect_to :controller => "logins"
        return false
      end
      return true
    end
 
  def logged_in?
    if (!session[:user_id].nil?)
      return true
    end
    return false
  end

end
