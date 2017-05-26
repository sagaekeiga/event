class PagesController < ApplicationController
  before_action :detect_variant

  def index
    @events = Event.all
    @q = Event.search(params[:q])
  end
  
  def entertainment
    @events = Event.all
    @q = Event.search(params[:q])
  end
  
  def sport
    @events = Event.all
    @q = Event.search(params[:q])
  end
  
  def business
    @events = Event.all
    @q = Event.search(params[:q])
  end
  
  def life
    @events = Event.all
    @q = Event.search(params[:q])
  end
  
  def art
    @events = Event.all
    @q = Event.search(params[:q])
  end
  
  def internet
    @events = Event.all
    @q = Event.search(params[:q])
  end
  
  def political
    @events = Event.all
    @q = Event.search(params[:q])
  end
  
  def local
    @events = Event.all
    @q = Event.search(params[:q])
  end
  
  def fashion
    @events = Event.all
    @q = Event.search(params[:q])
  end
  
  def other
    @events = Event.all
    @q = Event.search(params[:q])
  end
  
      private

        def detect_variant
          case request.user_agent
          when /ip(hone|od)/i
            request.variant = :phone
          when /android.+mobile/i
            request.variant = :phone
          end
        end
end
