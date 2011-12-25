class CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.create(params[:comment])
    respond_to do |format|
        format.html { redirect_to event_path(@event) } 
        format.js
    end
  end
end
