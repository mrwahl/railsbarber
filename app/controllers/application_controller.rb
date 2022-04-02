class ApplicationController < ActionController::Base

def set_cookie
cookies.permanent.signed[user_id] = "me"
end

end
