class ToppingsController < ApplicationController
    before_action :get_topping, only: [:show, :update, :delete]
   
    def index
        @toppings = Topping.all
    end
    
    def new
        @topping = Topping.new
    end

    def show
    end

    def create
        @topping = Topping.new(topping_params)
        if @topping.save
            redirect_to topping_path(@topping)
        else
            if Topping.find_by(img_url:@topping.img_url)
            flash[:error_message] = "You used a url that has been uploaded before."
            else
            flash[:error_message] = "Use a legit pic: .jpg .jpeg .png"
            end
            redirect_to toppings_path
        end
    end

    private
    def get_topping
        @topping = Topping.find(params[:id])
    end

    def topping_params 
        params.require(:topping).permit(:name,:img_url)
    end
end
