class EventsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index, :all_events]

  # GET /events
  # GET /events.json
  def index
    @events = Event.where("start >= ?", Time.now)
    @all = ''
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @events }
    end
  end

  #GET events/all_events
  def all_events
    @events = Event.order("created_at DESC")
    @all = "all"

    respond_to do |format|
      format.html { render 'events/index'}
      format.json { render :json => @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    @event.user = current_user

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, :notice => 'Event was successfully created.' }
        format.json { render :json => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, :notice => 'Event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])

    respond_to do |format|
        if @event.user == current_user
            @event.destroy

            format.html { redirect_to events_url }
            format.json { head :ok }
        else
            format.html { redirect_to events_path, :notice => 'Cannot delete event you did not create' }
        end
    end
  end
end
