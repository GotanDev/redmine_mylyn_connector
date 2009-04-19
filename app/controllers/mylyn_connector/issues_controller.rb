require File.dirname(__FILE__) + '/../../../lib/mylyn_connector'

class MylynConnector::IssuesController < ApplicationController
  unloadable

  before_filter :find_issue, :only => [:get]
  before_filter :find_project

  def get
    respond_to do |format|
      format.xml # get.xml.builder
      format.html {render :xml => @issue, :template => 'mylyn_connector/issues/get.rxml', :content_type => 'application/xml'}
#      format.html {render :xml => @issue, :content_type => 'application/xml'}
    end
    #render :xml => @issue
  end

  def query
  end

  private
  def find_issue
    @issue = ::Issue.find(params[:id], :include => :status)
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def find_project
    @project = @issue.project
  end

end