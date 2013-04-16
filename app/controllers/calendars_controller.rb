class CalendarsController < ApplicationController

  def index
    @calendars = Calendar.all

    respond_to do |format|
      format.xml { render :xml => @calendars, :except => [:created_at, :updated_at] }
      format.json { render :json => @calendars, :except => [:created_at, :updated_at] }
    end
  end

end
