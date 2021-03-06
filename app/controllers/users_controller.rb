class UsersController < ApplicationController
  def new
    @user = User.new
  end


  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to log_in_path(:email => @user.email), :notice => "Signed up!"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show html.erb
      format.json {render :json => @user}
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user= User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html  { redirect_to(@user,
                                   :notice => 'User was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @user.errors,
                              :status => :unprocessable_entity }
      end
    end
  end

end
