class ApplicationController < ActionController::Base
    before_action :set_user_type
    
    def set_user_type
        @user_type = params[:user_type]
    end
    
    def after_sign_in_path_for(profile)
        if(current_user.profile)
            if(params[:user][:user_type] == "buyer") || (params[:user][:user_type] == "returning_user")
                root_path
            else
                new_mushroom_path
            end
        else
            new_profile_path(user_type: params[:user][:user_type]) || root_path
        end
    end
    
    
end
