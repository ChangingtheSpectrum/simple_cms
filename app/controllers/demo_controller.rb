class DemoController < ApplicationController
  
  layout false

  def index
  	
  end

  def hello
  	#render('index')
  	@array=[1,2,3,4,5]
  	@id = params[:id].to_i
  	@page = params[:page].to_i
  end

  def other_hello
  	redirect_to(:controller => 'demo', :action => 'index')
  end

  def fuck_you
  	redirect_to("http://reddit.com/r/scarybilbo")
  end

  def text_helpers
  end

  def escape_output
  end
  
end
