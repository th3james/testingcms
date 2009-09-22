class LoginsController < ApplicationController
  def index
    render :action => 'login'
  end

  def login
  end

  def new
    @new_user = Login.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @section }
    end
  end

  def create
    @new_user = Login.new(params[:login])
    if (@new_user.save)
      flash[:notice] = 'User successfully created';
      respond_to do |format|
        format.html { redirect_to :action => 'index' }
        format.xml  { render :xml => @new_user, :status => :created, :location => @new_user }
      end
    else
      flash[:notice] = 'User creation failed.'
      respond_to do |format|
        format.html { render :action => "new" }
        format.xml  { render :xml => @new_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def do_login
    username = params[:user][:username]
    password = params[:user][:password]

    if (username.nil? || password.nil?)
      flash[:notice] = 'Please specify both your username and password'
      redirect_to :action => 'login'
    else
      login = Login.find(:first, :conditions => { :username => username, :password => password })
      if !login.nil?
        session[:user_id] = username
        session[:level] = login.level
        redirect_to sections_path
      elsif
        flash[:notice] = 'Incorrect username or password'
        redirect_to '/login'
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end

end

