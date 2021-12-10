class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  # before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
    if params[:term].present?
      @users = User.search_by_user(params[:term]).with_pg_search_highlight
    else
      @users = User.all
    end
  end

  # GET /users/1 or /users/1.json
  def show
    @joined_on = @user.created_at.to_formatted_s(:short)

    @last_login = if @user.current_sign_in_at
                    @user.current_sign_in_at.to_formatted_s(:short)
                  else
                    'never'
                  end
  end

  # GET /users/new
  def new
    # @user = User.new
  end

  # GET /users/1/edit
  def edit
    authorize! :edit, @add
  end

  # POST /users or /users.json
  def create
    # @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end
    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end

    if successfully_updated
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
    # respond_to do |format|
    #     if @user.update(user_params)
    #       format.html { redirect_to @user, notice: "User was successfully updated." }
    #       format.json { render :show, status: :ok, location: @user }
    #     else
    #       format.html { render :edit, status: :unprocessable_entity }
    #       format.json { render json: @user.errors, status: :unprocessable_entity }
    #     end
    # end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # def set_user
  #   @user = User.find(params[:id])
  # end

  def user_params
    params.require(:user).permit(:username, :email, :password,
                                 :password_confirmation, :role_id
    )
  end

  private

  def needs_password?(_user, params)
    params[:password].present?
  end
end
