class DemoController < ApplicationController

  layout 'application'

  def index
    render('index')
  end

  def hello
    @array = [1,2,3,4,5]
    @id = params['id']
    @page = params[:page]
    render('hello')
  end

  def hi
    redirect_to(:controller => 'demo', :action => 'hello')
  end

  def google
    redirect_to('http://google.com')
  end
end
