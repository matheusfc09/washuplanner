class CalendarsController < ApplicationController

  def create
    @calendar = Calendar.new(params[:calendar])

    respond_to do |format|
      if @calendar.save
        format.html { render :nothing => true }
        format.json { render :json => @calendar, :status => :created, :location => @calendar }
      else
        format.html { render :nothing => true, :status => :unprocessable_entity }
        format.json { render :json => @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @calendars = Calendar.all

    respond_to do |format|
      format.html { render :nothing => true }
      format.xml { render :xml => @calendars, :except => [:created_at, :updated_at] }
      format.json { render :json => @calendars, :except => [:created_at, :updated_at] }
    end
  end

end
