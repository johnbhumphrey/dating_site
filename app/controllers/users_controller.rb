class UsersController < ApplicationController
  skip_before_filter :authenticate, only: [ :new, :create ]
  before_filter :fetch_user, except: [ :index, :new, :create ]
  before_filter :correct_user, only: [ :update, :edit ]
  before_filter :admin_user, only: [ :destroy ]
  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page], per_page: 30)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
     
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        sign_in(@user)
        format.html { redirect_to root_path, notice: "#{@user.name} was successfully created." }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: "#{@user.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private

  def fetch_user
    @user= User.find(params[:id])
  end

  def correct_user
    user= User.find(params[:id])
    redirect_to root_url, flash: { notice: "you don't have access buddy" } unless current_user==user
  end

  def admin_user
    redirect_to root_url, flash: { error: "You can't do that" } unless current_user.admin?
  end
end
