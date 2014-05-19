class UiController < ApplicationController

  before_filter do
    redirect_to :root if Rails.env.production?
  end

  layout "application"

  def index
  end

  def home
    @videos = Video.all
    respond_to do |format|
     format.html # index.html.erb
     format.json { render json: @streaming_verifications }
   end
  end

end
