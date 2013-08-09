class BugReportsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create

  def index
    @bug_reports = BugReport.all
  end

  def show
  end

  def create    
    # binding.pry
    redirect_to :back
  end

end
