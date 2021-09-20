class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authorize_user, only: %i[edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  # GET /events
  def index
    @events = Event.all.sort_by(&:date)
  end

  # GET /events/1
  def show
  end

  # GET /events/new
  def new
    @event = current_user.events.build
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit, alert: "Event couldn't be updated. Please try again."
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    redirect_to root_path, notice: 'Event was successfully deleted.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def authorize_user
    redirect_to root_path, alert: 'You are not authorized to edit this event.' unless @event.creator == current_user
  end

  def event_params
    params.require(:event).permit(:title, :description, :date, :location, :creator_id)
  end
end
