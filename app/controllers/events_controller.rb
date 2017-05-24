class EventsController < ApplicationController

  before_filter :basic_auth, only: [:new, :edit, :manage, :destroy]

  def index
  end
  
  def new
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
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to @event
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def manage
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
          params.require(:event).permit(:name, :description, :image, :hp, :leader, :date, :time, :capacity, :place, :contact)
        end
 
        def basic_auth
          authenticate_or_request_with_http_basic do |user,pass|
            user == "s19930528" && "s19930528"
          end
        end
end
