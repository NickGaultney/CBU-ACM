class UsersController < ApplicationController
  CODE = "CBUACM41434D"

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorized, only: [:new, :create, :confirm_email]

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
    params[:user][:officer] = params[:user][:officer_code] == CODE
    @user = User.new(user_params)
    session[:user_id] = @user.id

    respond_to do |format|
      if @user.save
        UserMailer.registration_confirmation(@user).deliver
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm_email
    @user = User.find_by_confirm_token(params[:id])
    if @user
      @user.email_activate
      flash[:success] = "Welcome to the ACM website! Your email has been confirmed.
      Please sign in to continue."
      Rails.logger.info "*** Success! ***"
      redirect_to login_path
    else
      flash[:error] = "Sorry. User does not exist"
      Rails.logger.info "*** Fail! ***"
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :email_confirmed, :confirm_token, :username, :password, :password_confirmation, :title, :major, :officer)
    end
end
