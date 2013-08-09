class BugReportsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create

  def index
    @bug_reports = BugReport.all
  end

  def show
  end

  def create    
    # binding.pry
    br = BugReport.new do |b|
      b.description  = params[:description]
      b.page_url     = params[:page_url]
      b.browser_info = params[:browser_info]
    end
    br.save
  end

end
