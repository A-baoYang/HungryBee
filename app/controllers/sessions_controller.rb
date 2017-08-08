class SessionsController < ApplicationController
    def new
    end

    def create
        user = Order.find_by(name: params[:name])
        if order && order.authenticate(params[:password])
            session[:order_id] = user.id
            redirect_to root_path
        else
            redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end
end