class PagesController < ApplicationController
  def index
    @events = Event.all
    @q = Event.search(params[:q])
  end
end
