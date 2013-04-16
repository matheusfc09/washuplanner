class EventsController < ApplicationController

  def index
    if params[:date] and params[:calendar_ids]
      date = DateTime.parse(params[:date])
      calendar_ids = params[:calendar_ids].split(%r{\s*,\s*})
      @event_schedules_event_ids = EventSchedule.where("begin >= ? AND begin < ?", date.beginning_of_day, date.end_of_day).collect(&:event_id)
      @events = Event.includes(:event_schedules).where(:id => @event_schedules_event_ids).where(:calendar_id => calendar_ids).order("event_schedules.begin")
    else
      @events = []
    end

    respond_to do |format|
      format.xml { render :xml => @events.to_xml(:include => { :event_schedules => { :only => [:begin, :end] } }, :except => [:created_at, :updated_at]) }
      format.json { render :json => @events.to_json(:include => { :event_schedules => { :only => [:begin, :end] } }, :except => [:created_at, :updated_at]) }
    end
  end

  def today
    if params[:calendar_ids]
      date = DateTime.now
      calendar_ids = params[:calendar_ids].split(%r{\s*,\s*})
      @event_schedules_event_ids = EventSchedule.where("begin >= ? AND begin < ?", date.beginning_of_day, date.end_of_day).collect(&:event_id)
      @events = Event.includes(:event_schedules).where(:id => @event_schedules_event_ids).where(:calendar_id => calendar_ids).order("event_schedules.begin")
    else
      @events = []
    end

    respond_to do |format|
      format.xml { render :xml => @events.to_xml(:include => { :event_schedules => { :only => [:begin, :end] } }, :except => [:created_at, :updated_at]) }
      format.json { render :json => @events.to_json(:include => { :event_schedules => { :only => [:begin, :end] } }, :except => [:created_at, :updated_at]) }
    end
  end

end
