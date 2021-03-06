class ForumsController < ApplicationController
    before_action :set_forum, only: [:show, :edit, :update, :destroy]

    def index
        @forums = Forum.all
    end

    def show
        
    end

    def new
        @forum = Forum.new
    end

    def edit
    end

    def create 
        @forum = Forum.new({issue: params[:issue], description: params[:description]})
        @forum.user = current_user

        if @forum.save
            redirect_to @forum
        else
            render :new
        end
    end

    def update
        respond_to do |format|
            if @forum.update(forum_params)
                format.html { redirect_to @forum, notice: 'Forum was successfully updated!' }
                format.json { render :show, status: :ok, location: @forum }
            else
                format.html { render :edit }
                format.json { render json: @forum.errors, status: :unprocessable_entity }
            end 
        end
    end

    def destroy
        @forum.destroy
        respond_to do |format|
            format.html { redirect_to forums_url, notice: 'Forum was successfull destroyed.' }
            format.json { head :no_content }
        end
    end

    private

        def set_forum
            @forum = Forum.find(params[:id])
        end

        def forum_params
            params.require(:forum).permit(:issue, :description)
        end
end