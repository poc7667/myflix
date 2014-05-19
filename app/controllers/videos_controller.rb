class VideosController < ApplicationController

    def index
        binding.pry
        #@categories = Category.all
    end

    def show
        @video = Video.find(params[:id])
        binding.pry
    end
    
end
