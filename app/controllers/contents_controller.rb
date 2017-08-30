class ContentsController < ApplicationController
    before_action :set_content, only: [:show, :edit, :update, :destroy]

    def index
        @contents = Content.all
    end

    def new 
        @content = Content.new
    end

    def show
    end

    def edit
    end

    def create
        #@content = Content.new({nickname: params[:nickname], title: params[:title], essay: params[:essay]})
        # @content.user = current_user
        @content = Content.new(content_params)
        @content.user = current_user

        if @content.save
            redirect_to content_path(@content)
        else
            render :new
        end
    end

    def update 
        respond_to do |format|
            if @content.update(content_params)
                format.html { redirect_to @content, notice: 'Essay was successfully updated!' }
                format.json { render :show, status: :ok, location: @content }
            else
                format.html { render :edit }
                format.json { render json: @content.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @content.destroy
        respond_to do |format|
            format.html { redirect_to contents_url, notice: 'Essay was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private

        def set_content
            @content = Content.find(params[:id])
        end
        
        def content_params
            params.require(:content).permit(:title, :essay, :nickname)
        end
end