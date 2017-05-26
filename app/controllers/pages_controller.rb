class PagesController < ApplicationController
  before_action :detect_variant

  def index
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
