class PlayAuth::UsersController < PlayAuth::ApplicationController
  #before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  #def show
  #end

  # GET /users/new
  def new
    @user = User.new
  end

  def developers
    @users = User.all
  end

  def log_in_user
    p '~~~~~~~~~~~~~~'
    p params[:user_email]

    find_user = User.where(:email=>params[:user_email]).first
    sign_out if user_signed_in?
    sign_in :user, find_user 
    p find_user.name
    render :json => {
      current_user_name:find_user.name
      }, :status => 200
  end

  def guide

  end
 


  # GET /users/1/edit
  #def edit
  #end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        sign_in :user, @user
        format.html { redirect_to '/', notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  #def update
  #respond_to do |format|
  #if @user.update(user_params)
  #format.html { redirect_to @user, notice: 'User was successfully updated.' }
  #format.json { render :show, status: :ok, location: @user }
  #else
  #format.html { render :edit }
  #format.json { render json: @user.errors, status: :unprocessable_entity }
  #end
  #end
  #end

  # DELETE /users/1
  # DELETE /users/1.json
  #def destroy
  #@user.destroy
  #respond_to do |format|
  #format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
  #format.json { head :no_content }
  #end
  #end

  private
  # Use callbacks to share common setup or constraints between actions.
  #def set_user
  #@user = User.find(params[:id])
  #end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

