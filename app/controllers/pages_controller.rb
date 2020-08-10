class PagesController < ApplicationController

    def search  
        if params[:search].blank?  
            redirect_to(root_path, alert: "Please enter a search term") and return  
        else  
            @parameter = params[:search].downcase  
            @flavour = Flavour.where("lower(name) LIKE :search", search: "%#{@parameter}%")  
            @results = Mushroom.all.where(flavour_id: @flavour)
        end  
    end

end



