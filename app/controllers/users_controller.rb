class UsersController < ApplicationController

  before_action :check_if_logged_in, except: [:new, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.persisted?   # Log them in automatically after successful sign-up.
      session[:user_id] = @user.id
      flash[:notice] = 'You have successfully created an account.'
      redirect_to user_path( @user.id )
    else   # If error during sign-up, show the form again.
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @current_user = User.find( params[:id] )
    @current_user.update!( user_params )
    redirect_to user_path( @current_user.id )
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.destroy( params[:id] )
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :isAdmin, :isPremium)
    end
end
