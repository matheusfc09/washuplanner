class EventsController < ApplicationController

  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { render :nothing => true }
        format.json { render :json => @event, :status => :created, :location => @event }
      else
        format.html { render :nothing => true, :status => :unprocessable_entity }
        format.json { render :json => @event.errors, status: :unprocessable_entity }
      end
    end
  end

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
      format.html { render :nothing => true }
      format.xml { render :xml => @events.to_xml(:include => { :event_schedules => { :only => [:begin, :end, :place] } }, :except => [:created_at, :updated_at]) }
      format.json { render :json => @events.to_json(:include => { :event_schedules => { :only => [:begin, :end, :place] } }, :except => [:created_at, :updated_at]) }
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
      format.html { render :nothing => true }
      format.xml { render :xml => @events.to_xml(:include => { :event_schedules => { :only => [:begin, :end, :place] } }, :except => [:created_at, :updated_at]) }
      format.json { render :json => @events.to_json(:include => { :event_schedules => { :only => [:begin, :end, :place] } }, :except => [:created_at, :updated_at]) }
    end
  end

end
