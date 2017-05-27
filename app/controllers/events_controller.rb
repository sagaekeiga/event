class EventsController < ApplicationController

  before_filter :basic_auth, only: [:new, :edit, :manage, :destroy]
  before_action :detect_variant

  def index
    @q = Event.search(params[:q])
    @events = @q.result(distinct: true)
  end
  
  def new
    @q = Event.search(params[:q])
    @event = Event.new
  end
  
  def create
     @event = Event.new(event_params)
     if @event.save!
       redirect_to @event
     else
     end
  end
  
  def edit
    @q = Event.search(params[:q])
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to @event
  end
  
  def show
    @q = Event.search(params[:q])
    @event = Event.find(params[:id])
    @rank = REDIS.zincrby "events/all/#{Date.today.to_s}", 1, @event.id
    @event.rank = @rank
    @event.save!
  end
  
  def manage
    @q = Event.search(params[:q])
    @events = Event.all
  end
  
  
  def destroy
    @event = Event.find(params[:id])
    if @event.delete
     flash[:success] = "deleted"
    end
    redirect_to request.referer
  end
  
      private
      
        def event_params
          params.require(:event).permit(:name, :description, :image, :hp, :leader, :date, :start, :close, :capacity, :place, :contact, :category_list, :target)
        end
 
        def basic_auth
          authenticate_or_request_with_http_basic do |user,pass|
            user == "s19930528" && "s19930528"
          end
        end
        
        def detect_variant
          case request.user_agent
          when /ip(hone|od)/i
            request.variant = :phone
          when /android.+mobile/i
            request.variant = :phone
          end
        end
end
