class PagesController < ApplicationController

    def search  
        if params[:search].blank?  
            redirect_to(root_path, alert: "Please enter a search term") and return  
        else  
            @parameter = params[:search].downcase  
            @results = Mushroom.all.where("lower(flavour) LIKE :search", search: "%#{@parameter}%")
        end  
    end

end