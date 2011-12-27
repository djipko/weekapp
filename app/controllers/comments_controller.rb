class CommentsController < ApplicationController
  before_filter :authenticate_user! #in case some hacker tries with a direct POST...

  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.create(params[:comment])
    @comment.user = current_user
    respond_to do |format|
        format.html { redirect_to event_path(@event) } 
        format.js
    end
  end
end
