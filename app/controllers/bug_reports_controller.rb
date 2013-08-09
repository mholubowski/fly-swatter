class BugReportsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create

  def index
    if params[:user_id].nil?
      @bug_reports = BugReport.all
    else
      @bug_reports = User.find(params[:user_id]).bug_reports
    end

  end

  def show
  end

  def create    
    # binding.pry

    br = BugReport.new do |b|
      b.description  = params[:description]
      b.page_url     = params[:page_url]
      b.browser_info = params[:browser_info]
      b.user         = User.find_by_unique_key(params[:unique_key])
    end
    br.save
  end

end
